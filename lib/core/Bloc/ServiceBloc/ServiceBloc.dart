import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../data/entity/service_entity/service_entity.dart';
import '../../../domain/Repository/ServiceRepository.dart';
import '../../../layer/Widget/Storage.dart';

export 'package:vehicle_repair_service/data/entity/service_entity/service_entity.dart'
    show ServiceStatus;

part 'ServiceEvent.dart';

part 'ServiceState.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  static const int _pageSize = 10;

  final BaseServiceRepo repository;

  ServiceBloc(this.repository)
    : super(ServiceState(status: ServiceStatus.initial)) {
    on<FetchServiceEvent>(_fetchServiceApi);
    on<SearchEvent>(_fetchSearch);
  }

  Future<void> _fetchServiceApi(
    FetchServiceEvent event,
    Emitter<ServiceState> emit,
  ) async {
    final currentList = event.page == 1
        ? <Result>[]
        : List<Result>.from(state.result ?? const []);

    if (event.page > 1 && state.status == ServiceStatus.loading) return;

    if (event.page == 1) {
      emit(
        state.copyWith(
          status: ServiceStatus.loading,
          result: const [],
          msg: 'Loading pages !!!',
          hasMore: true,
        ),
      );
    }

    final token = await Storage.instance.getToken();
    final result = await repository.fetchService(
      url: '${dotenv.env["BASE_URL"]}${dotenv.env["FETCH_SERVICE"]}',
      header: {
        'Accept': 'application/json',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      },
      body: FormData.fromMap({'page': event.page.toString()}),
    );
    return result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg, hasMore: false)),
      (r) {
        final items = _items(r.result);
        final updateList = currentList..addAll(items);
        emit(
          state.copyWith(
            status: r.status,
            msg: r.msg,
            result: updateList,
            hasMore: items.length >= _pageSize,
          ),
        );
      },
    );
  }

  Future<void> _fetchSearch(
    SearchEvent event,
    Emitter<ServiceState> emit,
  ) async {
    final currentList = event.page == 1
        ? <Result>[]
        : List<Result>.from(state.result ?? const []);

    if (event.page > 1 && state.status == ServiceStatus.loading) return;

    if (event.page == 1) {
      emit(
        state.copyWith(
          status: ServiceStatus.loading,
          result: const [],
          msg: 'Loading pages !!!',
          hasMore: true,
        ),
      );
    }

    final token = await Storage.instance.getToken();
    final result = await repository.searchService(
      url: '${dotenv.env["BASE_URL"]}${dotenv.env["SEARCH_SERVICE"]}',
      header: {
        'Accept': 'application/json',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      },
      body: FormData.fromMap({
        'search': event.searchText,
        'page': event.page.toString(),
      }),
    );
    return result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg, hasMore: false)),
      (r) {
        final items = _items(r.result);
        final updateList = currentList..addAll(items);
        emit(
          state.copyWith(
            status: r.status,
            msg: r.msg,
            result: updateList,
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
