part of 'LocationRouteBloc.dart';

enum LocationRouteStatus { initial, loading, completed, error }

class LocationRouteState extends Equatable {
  final LocationRouteStatus? status;
  final String? msg;
  final List<String>? address;
  const LocationRouteState({this.status, this.msg, this.address});

  factory LocationRouteState.initial() {
    return LocationRouteState(status: LocationRouteStatus.initial);
  }

  LocationRouteState copyWith({
    LocationRouteStatus? status,
    String? msg,
    List<String>? address,
  }) {
    return LocationRouteState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      address: address ?? this.address,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, msg, address];
}
