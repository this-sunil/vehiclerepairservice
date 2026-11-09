import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../data/entity/notification_entity/notification_entity.dart';
import '../../../domain/Repository/NotificationRepo.dart';
import '../../../layer/Widget/Storage.dart';

export 'package:vehicle_repair_service/data/entity/notification_entity/notification_entity.dart'
    show NotificationStatus;

part 'NotificationEvent.dart';

part 'NotificationState.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  static const int _pageSize = 10;

  final BaseNotificationRepo repository;

  NotificationBloc(this.repository) : super(NotificationState.initial()) {
    on<FetchNotificationEvent>(_fetchNotification);
  }

  Future<void> _fetchNotification(
    FetchNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    if (event.page > 1 && state.status == NotificationStatus.loading) return;

    final currentList = event.page == 1
        ? <Result>[]
        : List<Result>.from(state.model ?? const []);

    if (event.page == 1) {
      emit(
        state.copyWith(
          status: NotificationStatus.loading,
          model: const [],
          hasMore: true,
        ),
      );
    }

    final uid = await Storage.instance.getUID();
    final token = await Storage.instance.getToken();
    final body = {'uid': uid, 'page': event.page.toString()};
    final header = {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    log('message=>$body');
    final result = await repository.fetchNotification(
      url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_NOTIFICATION']}',
      body: body,
      header: header,
    );

    return result.fold(
      (l) => emit(
        state.copyWith(
          status: l.status,
          msg: l.msg,
          hasMore: false,
          model: event.page == 1 ? const [] : state.model,
        ),
      ),
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
