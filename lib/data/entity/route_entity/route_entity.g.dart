// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteEntity _$RouteEntityFromJson(Map<String, dynamic> json) => _RouteEntity(
  code: json['code'] as String?,
  routes: (json['routes'] as List<dynamic>?)
      ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
      .toList(),
  waypoints: (json['waypoints'] as List<dynamic>?)
      ?.map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RouteEntityToJson(_RouteEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'routes': instance.routes,
      'waypoints': instance.waypoints,
    };

_Route _$RouteFromJson(Map<String, dynamic> json) => _Route(
  legs: (json['legs'] as List<dynamic>?)
      ?.map((e) => Leg.fromJson(e as Map<String, dynamic>))
      .toList(),
  weightName: json['weight_name'] as String?,
  geometry: json['geometry'] == null
      ? null
      : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
  weight: (json['weight'] as num?)?.toDouble(),
  duration: (json['duration'] as num?)?.toInt(),
  distance: (json['distance'] as num?)?.toInt(),
);

Map<String, dynamic> _$RouteToJson(_Route instance) => <String, dynamic>{
  'legs': instance.legs,
  'weight_name': instance.weightName,
  'geometry': instance.geometry,
  'weight': instance.weight,
  'duration': instance.duration,
  'distance': instance.distance,
};

_Geometry _$GeometryFromJson(Map<String, dynamic> json) => _Geometry(
  coordinates: (json['coordinates'] as List<dynamic>?)
      ?.map(
        (e) => (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
      )
      .toList(),
  type: json['type'] as String?,
);

Map<String, dynamic> _$GeometryToJson(_Geometry instance) => <String, dynamic>{
  'coordinates': instance.coordinates,
  'type': instance.type,
};

_Leg _$LegFromJson(Map<String, dynamic> json) => _Leg(
  steps: json['steps'] as List<dynamic>?,
  weight: (json['weight'] as num?)?.toDouble(),
  summary: json['summary'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  distance: (json['distance'] as num?)?.toInt(),
);

Map<String, dynamic> _$LegToJson(_Leg instance) => <String, dynamic>{
  'steps': instance.steps,
  'weight': instance.weight,
  'summary': instance.summary,
  'duration': instance.duration,
  'distance': instance.distance,
};

_Waypoint _$WaypointFromJson(Map<String, dynamic> json) => _Waypoint(
  hint: json['hint'] as String?,
  location: (json['location'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList(),
  name: json['name'] as String?,
  distance: (json['distance'] as num?)?.toInt(),
);

Map<String, dynamic> _$WaypointToJson(_Waypoint instance) => <String, dynamic>{
  'hint': instance.hint,
  'location': instance.location,
  'name': instance.name,
  'distance': instance.distance,
};
