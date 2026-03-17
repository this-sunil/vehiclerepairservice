import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../domain/Repository/LocationRouteRepo.dart';
part 'LocationRouteEvent.dart';
part 'LocationRouteState.dart';

class LocationRouteBloc extends Bloc<LocationRouteEvent,LocationRouteState>{
  final LocationRouteRepo repository;
  LocationRouteBloc(this.repository):super(LocationRouteState.initial()){
    on<FetchListEvent>(_fetchLocationRoute);
  }

  Future<void> _fetchLocationRoute(
      FetchListEvent event,
      Emitter<LocationRouteState> emit,
      ) async {
    emit(state.copyWith(
      status: LocationRouteStatus.loading,
      address: [],
    ));

    final List<String> addressList = [];

    for (final LatLng p in event.points) {
      final result = await repository.fetchRouteInfo(
        lat: p.latitude,
        long: p.longitude,
      );

      result.fold(
            (l) {
          return emit(state.copyWith(
            status: LocationRouteStatus.error,
            msg: l.msg,
          ));

        },
            (r) {
          addressList.add(r.result);
        },
      );
    }
    final uniqueList = addressList.toSet().toList();

    return emit(state.copyWith(
      status: LocationRouteStatus.completed,
      address: uniqueList,
    ));
  }

}