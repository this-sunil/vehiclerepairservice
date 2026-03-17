import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/Model/SlotHistoryModel.dart';
import '../../../domain/Repository/BookRepository.dart';
import '../../../layer/Widget/Storage.dart';
part 'BookEvent.dart';
part 'BookState.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository repository;
  BookBloc(this.repository) : super(BookState.initial()) {
    on<BookAppointEvent>(_bookAppointment);
    on<FetchSlotHistoryEvent>(_fetchSlotHistory);
  }
  Future<void> _bookAppointment(
    BookAppointEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(state.copyWith(status: BookStatus.loading));
    String? uid = await Storage.instance.getUID();
    String? token = await Storage.instance.getToken();
    Map<String, String> body = {
      'uid': uid.toString(),
      'vehicle_name': event.vehicleName,
      'photo': event.photo.path,
      'vehicle_type': event.vehicleType,
      'registerNo': event.registerNo,
      'service_name': event.serviceName,
      'slot_date': event.slotDate,
      'slot_time': event.slotTime,
    };
    Map<String, String> header = {
      "Content-Type": "multipart/form-data",
      "accept": "application/json",
      "Authorization": "Bearer $token",
    };
    log("Register=>${body['registerNo']}");
    final result = await repository.bookAppointment(
      url: '${dotenv.env['BASE_URL']}${dotenv.env['BOOK_APPOINTMENT']}',
      header: header,
      body: body,
    );
    return result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg)),
      (r) => emit(state.copyWith(status: r.status, msg: r.msg)),
    );
  }
  Future<void> _fetchSlotHistory(
      FetchSlotHistoryEvent event,
      Emitter<BookState> emit,
      ) async {
    final uid = await Storage.instance.getUID();
    final token = await Storage.instance.getToken();

    final List<Result> currentList = event.page == 1 ? [] : List.from(state.model ?? []);

    if (event.page == 1) {
      emit(
        state.copyWith(
          status: BookStatus.loading,
          model: [],
          hasMore: true,
        ),
      );
    }

    final result = await repository.fetchSlotHistory(
      url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_SLOT_HISTORY']}',
      header: {
        'Authorization': 'Bearer $token',
        'accept': 'application/json',
      },
      body: {
        'uid': uid,
        'page': event.page.toString(),
      },
    );

    result.fold(
          (l) => emit(
        state.copyWith(
          status: l.status,
          msg: l.msg,
          hasMore: false,
        ),
      ),
          (r) {
        final updatedList = currentList..addAll(r.result);

        emit(
          state.copyWith(
            status: r.status,
            msg: r.msg,
            model: updatedList,
            hasMore: r.result.length == 10
          ),
        );
      },
    );
  }

}
