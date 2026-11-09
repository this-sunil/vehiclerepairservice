import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/Repository/LocationRouteRepo.dart';

import 'package:vehicle_repair_service/data/entity/LocationModel.dart'
    show LocationRouteStatus;

export 'package:vehicle_repair_service/data/entity/LocationModel.dart'
    show LocationRouteStatus;

part 'LocationRouteEvent.dart';
part 'LocationRouteState.dart';

class LocationRouteBloc extends Bloc<LocationRouteEvent, LocationRouteState> {
  final BaseLocationRouteRepo repository;

  LocationRouteBloc(this.repository) : super(LocationRouteState.initial()) {
    on<FetchListEvent>(_fetchLocationRoute);
  }

  Future<void> _fetchLocationRoute(
    FetchListEvent event,
    Emitter<LocationRouteState> emit,
  ) async {
    emit(
      state.copyWith(status: LocationRouteStatus.loading, address: const []),
    );

    final List<String> addressList = [];

    for (final point in event.points) {
      final result = await repository.fetchRouteInfo(
        lat: point.latitude,
        long: point.longitude,
      );

      String? errorMessage;
      result.fold(
        (failure) => errorMessage = failure.msg,
        (success) => addressList.add(success.result.toString()),
      );

      if (errorMessage != null) {
        emit(
          state.copyWith(status: LocationRouteStatus.error, msg: errorMessage),
        );
        return;
      }
    }

    final uniqueList = addressList.toSet().toList();
    emit(
      state.copyWith(
        status: LocationRouteStatus.completed,
        address: uniqueList,
      ),
    );
  }
}
