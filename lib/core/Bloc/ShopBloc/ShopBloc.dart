import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../data/entity/shop_entity/shop_entity.dart';
import '../../../domain/Repository/SearchShopRepository.dart';
import '../../../layer/Widget/Storage.dart';

export 'package:vehicle_repair_service/data/entity/shop_entity/shop_entity.dart'
    show ShopStatus;

part 'ShopEvent.dart';

part 'ShopState.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  static const int _pageSize = 10;

  final BaseSearchShopRepo repo;

  ShopBloc(this.repo) : super(ShopState.initial()) {
    on<SearchNearByCityEvent>(_searchByCity);
  }

  Future<void> _searchByCity(
    SearchNearByCityEvent event,
    Emitter<ShopState> emit,
  ) async {
    if (event.page > 1 && state.status == ShopStatus.loading) return;

    final currentList = event.page == 1
        ? <Result>[]
        : List<Result>.from(state.model ?? const []);

    if (event.page == 1) {
      emit(
        state.copyWith(
          status: ShopStatus.loading,
          model: const [],
          hasMore: true,
        ),
      );
    }

    final token = await Storage.instance.getToken();
    final body = {'page': event.page.toString(), 'city': event.city};
    final header = {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    final result = await repo.searchByCity(
      url: '${dotenv.env["BASE_URL"]}${dotenv.env['SEARCH_BY_CITY']}',
      body: body,
      header: header,
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
            model: updateList,
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
