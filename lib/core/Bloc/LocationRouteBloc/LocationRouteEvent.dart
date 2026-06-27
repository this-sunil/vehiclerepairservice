part of 'LocationRouteBloc.dart';
abstract class LocationRouteEvent extends Equatable{}

class FetchListEvent extends LocationRouteEvent{
  final List<LatLng> points;
  FetchListEvent({required this.points});
  @override
  // TODO: implement props
  List<Object?> get props => [points];
}