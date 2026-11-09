import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/entity/slot_entity/slot_entity.dart';
import '../../../domain/Repository/BookRepository.dart';
import '../../../layer/Widget/Storage.dart';

import 'package:vehicle_repair_service/data/entity/book_entity/book_entity.dart'
    show BookStatus;

export 'package:vehicle_repair_service/data/entity/book_entity/book_entity.dart'
    show BookStatus;

part 'BookEvent.dart';

part 'BookState.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  static const int _pageSize = 10;

  final BaseBookRepo repository;

  BookBloc(this.repository) : super(BookState.initial()) {
    on<BookAppointEvent>(_bookAppointment);
    on<FetchSlotHistoryEvent>(_fetchSlotHistory);
  }

  Future<void> _bookAppointment(
    BookAppointEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(state.copyWith(status: BookStatus.loading));

    final uid = await Storage.instance.getUID();
    final token = await Storage.instance.getToken();
    if (uid == null || uid.isEmpty) {
      emit(
        state.copyWith(
          status: BookStatus.error,
          msg: 'Session expired. Please login again.',
        ),
      );
      return;
    }

    try {
      final body = <String, dynamic>{
        'id': uid,
        'vehicle_name': event.vehicleName,
        'vehicle_type': event.vehicleType,
        'registration_no': event.registerNo,
        'service_name': event.serviceName,
        'slot_date': event.slotDate,
        'slot_time': event.slotTime,
      };

      if (event.photo.path.isNotEmpty) {
        body['vehicle_photo'] = await MultipartFile.fromFile(
          event.photo.path,
          filename: event.photo.path.split('/').last,
        );
      }

      final header = {
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      };

      final result = await repository.bookAppointment(
        url: '${dotenv.env['BASE_URL']}${dotenv.env['BOOK_APPOINTMENT']}',
        header: header,
        body: FormData.fromMap(body),
      );
      result.fold(
        (l) => emit(state.copyWith(status: l.status, msg: l.msg)),
        (r) => emit(state.copyWith(status: r.status, msg: r.msg)),
      );
    } catch (e) {
      log('Book appointment error=>$e');
      emit(
        state.copyWith(
          status: BookStatus.error,
          msg: 'Unable to book appointment. Please try again.',
        ),
      );
    }
  }

  Future<void> _fetchSlotHistory(
    FetchSlotHistoryEvent event,
    Emitter<BookState> emit,
  ) async {
    if (event.page > 1 && state.status == BookStatus.loading) return;

    final currentList = event.page == 1
        ? <Result>[]
        : List<Result>.from(state.model ?? const []);

    if (event.page == 1) {
      emit(
        state.copyWith(
          status: BookStatus.loading,
          model: const [],
          hasMore: true,
        ),
      );
    }

    final uid = await Storage.instance.getUID();
    final token = await Storage.instance.getToken();

    final result = await repository.fetchSlotHistory(
      url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_SLOT_HISTORY']}',
      header: {
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: FormData.fromMap({'uid': uid ?? '', 'page': event.page.toString()}),
    );

    result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg, hasMore: false)),
      (r) {
        final items = _items(r.result);
        final updatedList = currentList..addAll(items);
        emit(
          state.copyWith(
            status: r.status,
            msg: r.msg,
            model: updatedList,
            hasMore: items.length >= _pageSize,
          ),
        );
      },
    );
  }

  List<Result> _items(dynamic value) {
    if (value is List) return value.whereType<Result>().toList();
    return const [];
  }
}
