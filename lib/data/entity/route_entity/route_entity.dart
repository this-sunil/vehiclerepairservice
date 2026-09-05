import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_entity.freezed.dart';

part 'route_entity.g.dart';

@freezed
abstract class RouteEntity with _$RouteEntity {
  const factory RouteEntity({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "routes") List<Route>? routes,
    @JsonKey(name: "waypoints") List<Waypoint>? waypoints,
  }) = _RouteEntity;

  factory RouteEntity.fromJson(Map<String, dynamic> json) =>
      _$RouteEntityFromJson(json);
}

@freezed
abstract class Route with _$Route {
  const factory Route({
    @JsonKey(name: "legs") List<Leg>? legs,
    @JsonKey(name: "weight_name") String? weightName,
    @JsonKey(name: "geometry") Geometry? geometry,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "duration") int? duration,
    @JsonKey(name: "distance") int? distance,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}

@freezed
abstract class Geometry with _$Geometry {
  const factory Geometry({
    @JsonKey(name: "coordinates") List<List<double>>? coordinates,
    @JsonKey(name: "type") String? type,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}

@freezed
abstract class Leg with _$Leg {
  const factory Leg({
    @JsonKey(name: "steps") List<dynamic>? steps,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "summary") String? summary,
    @JsonKey(name: "duration") int? duration,
    @JsonKey(name: "distance") int? distance,
  }) = _Leg;

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
}

@freezed
abstract class Waypoint with _$Waypoint {
  const factory Waypoint({
    @JsonKey(name: "hint") String? hint,
    @JsonKey(name: "location") List<double>? location,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "distance") int? distance,
  }) = _Waypoint;

  factory Waypoint.fromJson(Map<String, dynamic> json) =>
      _$WaypointFromJson(json);
}
