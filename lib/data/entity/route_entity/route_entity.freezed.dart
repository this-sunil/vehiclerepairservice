// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteEntity {

@JsonKey(name: "code") String? get code;@JsonKey(name: "routes") List<Route>? get routes;@JsonKey(name: "waypoints") List<Waypoint>? get waypoints;
/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteEntityCopyWith<RouteEntity> get copyWith => _$RouteEntityCopyWithImpl<RouteEntity>(this as RouteEntity, _$identity);

  /// Serializes this RouteEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RouteEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteEntity&&(identical(other.code, _this.code) || other.code == _this.code)&&const DeepCollectionEquality().equals(other.routes, _this.routes)&&const DeepCollectionEquality().equals(other.waypoints, _this.waypoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RouteEntity;
  return Object.hash(runtimeType,_this.code,const DeepCollectionEquality().hash(_this.routes),const DeepCollectionEquality().hash(_this.waypoints));
}

@override
String toString() {
  final _this = this as RouteEntity;
  return 'RouteEntity(code: ${_this.code}, routes: ${_this.routes}, waypoints: ${_this.waypoints})';
}


}

/// @nodoc
abstract mixin class $RouteEntityCopyWith<$Res>  {
  factory $RouteEntityCopyWith(RouteEntity value, $Res Function(RouteEntity) _then) = _$RouteEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "code") String? code,@JsonKey(name: "routes") List<Route>? routes,@JsonKey(name: "waypoints") List<Waypoint>? waypoints
});




}
/// @nodoc
class _$RouteEntityCopyWithImpl<$Res>
    implements $RouteEntityCopyWith<$Res> {
  _$RouteEntityCopyWithImpl(this._self, this._then);

  final RouteEntity _self;
  final $Res Function(RouteEntity) _then;

/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? routes = freezed,Object? waypoints = freezed,}) {
  return _then(RouteEntity(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,routes: freezed == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as List<Route>?,waypoints: freezed == waypoints ? _self.waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<Waypoint>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteEntity].
extension RouteEntityPatterns on RouteEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteEntity value)  $default,){
final _that = this;
switch (_that) {
case _RouteEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  String? code, @JsonKey(name: "routes")  List<Route>? routes, @JsonKey(name: "waypoints")  List<Waypoint>? waypoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
return $default(_that.code,_that.routes,_that.waypoints);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  String? code, @JsonKey(name: "routes")  List<Route>? routes, @JsonKey(name: "waypoints")  List<Waypoint>? waypoints)  $default,) {final _that = this;
switch (_that) {
case _RouteEntity():
return $default(_that.code,_that.routes,_that.waypoints);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "code")  String? code, @JsonKey(name: "routes")  List<Route>? routes, @JsonKey(name: "waypoints")  List<Waypoint>? waypoints)?  $default,) {final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
return $default(_that.code,_that.routes,_that.waypoints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteEntity implements RouteEntity {
  const _RouteEntity({@JsonKey(name: "code") this.code, @JsonKey(name: "routes")  List<Route>? routes, @JsonKey(name: "waypoints")  List<Waypoint>? waypoints}): _routes = routes,_waypoints = waypoints;
  factory _RouteEntity.fromJson(Map<String, dynamic> json) => _$RouteEntityFromJson(json);

@override@JsonKey(name: "code") final  String? code;
 final  List<Route>? _routes;
@override@JsonKey(name: "routes") List<Route>? get routes {
  final value = _routes;
  if (value == null) return null;
  if (_routes is EqualUnmodifiableListView) return _routes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Waypoint>? _waypoints;
@override@JsonKey(name: "waypoints") List<Waypoint>? get waypoints {
  final value = _waypoints;
  if (value == null) return null;
  if (_waypoints is EqualUnmodifiableListView) return _waypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteEntityCopyWith<_RouteEntity> get copyWith => __$RouteEntityCopyWithImpl<_RouteEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteEntity&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.routes, _routes)&&const DeepCollectionEquality().equals(other.waypoints, _waypoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_routes),const DeepCollectionEquality().hash(_waypoints));
}

@override
String toString() {
    return 'RouteEntity(code: $code, routes: $routes, waypoints: $waypoints)';
}


}

/// @nodoc
abstract mixin class _$RouteEntityCopyWith<$Res> implements $RouteEntityCopyWith<$Res> {
  factory _$RouteEntityCopyWith(_RouteEntity value, $Res Function(_RouteEntity) _then) = __$RouteEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "code") String? code,@JsonKey(name: "routes") List<Route>? routes,@JsonKey(name: "waypoints") List<Waypoint>? waypoints
});




}
/// @nodoc
class __$RouteEntityCopyWithImpl<$Res>
    implements _$RouteEntityCopyWith<$Res> {
  __$RouteEntityCopyWithImpl(this._self, this._then);

  final _RouteEntity _self;
  final $Res Function(_RouteEntity) _then;

/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? routes = freezed,Object? waypoints = freezed,}) {
  return _then(_RouteEntity(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,routes: freezed == routes ? _self._routes : routes // ignore: cast_nullable_to_non_nullable
as List<Route>?,waypoints: freezed == waypoints ? _self._waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<Waypoint>?,
  ));
}


}


/// @nodoc
mixin _$Route {

@JsonKey(name: "legs") List<Leg>? get legs;@JsonKey(name: "weight_name") String? get weightName;@JsonKey(name: "geometry") Geometry? get geometry;@JsonKey(name: "weight") double? get weight;@JsonKey(name: "duration") int? get duration;@JsonKey(name: "distance") int? get distance;
/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteCopyWith<Route> get copyWith => _$RouteCopyWithImpl<Route>(this as Route, _$identity);

  /// Serializes this Route to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Route;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Route&&const DeepCollectionEquality().equals(other.legs, _this.legs)&&(identical(other.weightName, _this.weightName) || other.weightName == _this.weightName)&&(identical(other.geometry, _this.geometry) || other.geometry == _this.geometry)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.distance, _this.distance) || other.distance == _this.distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Route;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.legs),_this.weightName,_this.geometry,_this.weight,_this.duration,_this.distance);
}

@override
String toString() {
  final _this = this as Route;
  return 'Route(legs: ${_this.legs}, weightName: ${_this.weightName}, geometry: ${_this.geometry}, weight: ${_this.weight}, duration: ${_this.duration}, distance: ${_this.distance})';
}


}

/// @nodoc
abstract mixin class $RouteCopyWith<$Res>  {
  factory $RouteCopyWith(Route value, $Res Function(Route) _then) = _$RouteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "legs") List<Leg>? legs,@JsonKey(name: "weight_name") String? weightName,@JsonKey(name: "geometry") Geometry? geometry,@JsonKey(name: "weight") double? weight,@JsonKey(name: "duration") int? duration,@JsonKey(name: "distance") int? distance
});


$GeometryCopyWith<$Res>? get geometry;

}
/// @nodoc
class _$RouteCopyWithImpl<$Res>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._self, this._then);

  final Route _self;
  final $Res Function(Route) _then;

/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? legs = freezed,Object? weightName = freezed,Object? geometry = freezed,Object? weight = freezed,Object? duration = freezed,Object? distance = freezed,}) {
  return _then(Route(
legs: freezed == legs ? _self.legs : legs // ignore: cast_nullable_to_non_nullable
as List<Leg>?,weightName: freezed == weightName ? _self.weightName : weightName // ignore: cast_nullable_to_non_nullable
as String?,geometry: freezed == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeometryCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
    return null;
  }

  return $GeometryCopyWith<$Res>(_self.geometry!, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}
}


/// Adds pattern-matching-related methods to [Route].
extension RoutePatterns on Route {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Route value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Route value)  $default,){
final _that = this;
switch (_that) {
case _Route():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Route value)?  $default,){
final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "legs")  List<Leg>? legs, @JsonKey(name: "weight_name")  String? weightName, @JsonKey(name: "geometry")  Geometry? geometry, @JsonKey(name: "weight")  double? weight, @JsonKey(name: "duration")  int? duration, @JsonKey(name: "distance")  int? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that.legs,_that.weightName,_that.geometry,_that.weight,_that.duration,_that.distance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "legs")  List<Leg>? legs, @JsonKey(name: "weight_name")  String? weightName, @JsonKey(name: "geometry")  Geometry? geometry, @JsonKey(name: "weight")  double? weight, @JsonKey(name: "duration")  int? duration, @JsonKey(name: "distance")  int? distance)  $default,) {final _that = this;
switch (_that) {
case _Route():
return $default(_that.legs,_that.weightName,_that.geometry,_that.weight,_that.duration,_that.distance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "legs")  List<Leg>? legs, @JsonKey(name: "weight_name")  String? weightName, @JsonKey(name: "geometry")  Geometry? geometry, @JsonKey(name: "weight")  double? weight, @JsonKey(name: "duration")  int? duration, @JsonKey(name: "distance")  int? distance)?  $default,) {final _that = this;
switch (_that) {
case _Route() when $default != null:
return $default(_that.legs,_that.weightName,_that.geometry,_that.weight,_that.duration,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Route implements Route {
  const _Route({@JsonKey(name: "legs")  List<Leg>? legs, @JsonKey(name: "weight_name") this.weightName, @JsonKey(name: "geometry") this.geometry, @JsonKey(name: "weight") this.weight, @JsonKey(name: "duration") this.duration, @JsonKey(name: "distance") this.distance}): _legs = legs;
  factory _Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

 final  List<Leg>? _legs;
@override@JsonKey(name: "legs") List<Leg>? get legs {
  final value = _legs;
  if (value == null) return null;
  if (_legs is EqualUnmodifiableListView) return _legs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "weight_name") final  String? weightName;
@override@JsonKey(name: "geometry") final  Geometry? geometry;
@override@JsonKey(name: "weight") final  double? weight;
@override@JsonKey(name: "duration") final  int? duration;
@override@JsonKey(name: "distance") final  int? distance;

/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteCopyWith<_Route> get copyWith => __$RouteCopyWithImpl<_Route>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Route&&const DeepCollectionEquality().equals(other.legs, _legs)&&(identical(other.weightName, weightName) || other.weightName == weightName)&&(identical(other.geometry, geometry) || other.geometry == geometry)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_legs),weightName,geometry,weight,duration,distance);
}

@override
String toString() {
    return 'Route(legs: $legs, weightName: $weightName, geometry: $geometry, weight: $weight, duration: $duration, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$RouteCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$RouteCopyWith(_Route value, $Res Function(_Route) _then) = __$RouteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "legs") List<Leg>? legs,@JsonKey(name: "weight_name") String? weightName,@JsonKey(name: "geometry") Geometry? geometry,@JsonKey(name: "weight") double? weight,@JsonKey(name: "duration") int? duration,@JsonKey(name: "distance") int? distance
});


@override $GeometryCopyWith<$Res>? get geometry;

}
/// @nodoc
class __$RouteCopyWithImpl<$Res>
    implements _$RouteCopyWith<$Res> {
  __$RouteCopyWithImpl(this._self, this._then);

  final _Route _self;
  final $Res Function(_Route) _then;

/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? legs = freezed,Object? weightName = freezed,Object? geometry = freezed,Object? weight = freezed,Object? duration = freezed,Object? distance = freezed,}) {
  return _then(_Route(
legs: freezed == legs ? _self._legs : legs // ignore: cast_nullable_to_non_nullable
as List<Leg>?,weightName: freezed == weightName ? _self.weightName : weightName // ignore: cast_nullable_to_non_nullable
as String?,geometry: freezed == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as Geometry?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Route
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeometryCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
    return null;
  }

  return $GeometryCopyWith<$Res>(_self.geometry!, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}
}


/// @nodoc
mixin _$Geometry {

@JsonKey(name: "coordinates") List<List<double>>? get coordinates;@JsonKey(name: "type") String? get type;
/// Create a copy of Geometry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeometryCopyWith<Geometry> get copyWith => _$GeometryCopyWithImpl<Geometry>(this as Geometry, _$identity);

  /// Serializes this Geometry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Geometry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Geometry&&const DeepCollectionEquality().equals(other.coordinates, _this.coordinates)&&(identical(other.type, _this.type) || other.type == _this.type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Geometry;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.coordinates),_this.type);
}

@override
String toString() {
  final _this = this as Geometry;
  return 'Geometry(coordinates: ${_this.coordinates}, type: ${_this.type})';
}


}

/// @nodoc
abstract mixin class $GeometryCopyWith<$Res>  {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) _then) = _$GeometryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "coordinates") List<List<double>>? coordinates,@JsonKey(name: "type") String? type
});




}
/// @nodoc
class _$GeometryCopyWithImpl<$Res>
    implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._self, this._then);

  final Geometry _self;
  final $Res Function(Geometry) _then;

/// Create a copy of Geometry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coordinates = freezed,Object? type = freezed,}) {
  return _then(Geometry(
coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<List<double>>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Geometry].
extension GeometryPatterns on Geometry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Geometry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Geometry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Geometry value)  $default,){
final _that = this;
switch (_that) {
case _Geometry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Geometry value)?  $default,){
final _that = this;
switch (_that) {
case _Geometry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "coordinates")  List<List<double>>? coordinates, @JsonKey(name: "type")  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Geometry() when $default != null:
return $default(_that.coordinates,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "coordinates")  List<List<double>>? coordinates, @JsonKey(name: "type")  String? type)  $default,) {final _that = this;
switch (_that) {
case _Geometry():
return $default(_that.coordinates,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "coordinates")  List<List<double>>? coordinates, @JsonKey(name: "type")  String? type)?  $default,) {final _that = this;
switch (_that) {
case _Geometry() when $default != null:
return $default(_that.coordinates,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Geometry implements Geometry {
  const _Geometry({@JsonKey(name: "coordinates")  List<List<double>>? coordinates, @JsonKey(name: "type") this.type}): _coordinates = coordinates;
  factory _Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);

 final  List<List<double>>? _coordinates;
@override@JsonKey(name: "coordinates") List<List<double>>? get coordinates {
  final value = _coordinates;
  if (value == null) return null;
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "type") final  String? type;

/// Create a copy of Geometry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeometryCopyWith<_Geometry> get copyWith => __$GeometryCopyWithImpl<_Geometry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeometryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Geometry&&const DeepCollectionEquality().equals(other.coordinates, _coordinates)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_coordinates),type);
}

@override
String toString() {
    return 'Geometry(coordinates: $coordinates, type: $type)';
}


}

/// @nodoc
abstract mixin class _$GeometryCopyWith<$Res> implements $GeometryCopyWith<$Res> {
  factory _$GeometryCopyWith(_Geometry value, $Res Function(_Geometry) _then) = __$GeometryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "coordinates") List<List<double>>? coordinates,@JsonKey(name: "type") String? type
});




}
/// @nodoc
class __$GeometryCopyWithImpl<$Res>
    implements _$GeometryCopyWith<$Res> {
  __$GeometryCopyWithImpl(this._self, this._then);

  final _Geometry _self;
  final $Res Function(_Geometry) _then;

/// Create a copy of Geometry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coordinates = freezed,Object? type = freezed,}) {
  return _then(_Geometry(
coordinates: freezed == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<List<double>>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Leg {

@JsonKey(name: "steps") List<dynamic>? get steps;@JsonKey(name: "weight") double? get weight;@JsonKey(name: "summary") String? get summary;@JsonKey(name: "duration") int? get duration;@JsonKey(name: "distance") int? get distance;
/// Create a copy of Leg
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegCopyWith<Leg> get copyWith => _$LegCopyWithImpl<Leg>(this as Leg, _$identity);

  /// Serializes this Leg to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Leg;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Leg&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.distance, _this.distance) || other.distance == _this.distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Leg;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.steps),_this.weight,_this.summary,_this.duration,_this.distance);
}

@override
String toString() {
  final _this = this as Leg;
  return 'Leg(steps: ${_this.steps}, weight: ${_this.weight}, summary: ${_this.summary}, duration: ${_this.duration}, distance: ${_this.distance})';
}


}

/// @nodoc
abstract mixin class $LegCopyWith<$Res>  {
  factory $LegCopyWith(Leg value, $Res Function(Leg) _then) = _$LegCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "steps") List<dynamic>? steps,@JsonKey(name: "weight") double? weight,@JsonKey(name: "summary") String? summary,@JsonKey(name: "duration") int? duration,@JsonKey(name: "distance") int? distance
});




}
/// @nodoc
class _$LegCopyWithImpl<$Res>
    implements $LegCopyWith<$Res> {
  _$LegCopyWithImpl(this._self, this._then);

  final Leg _self;
  final $Res Function(Leg) _then;

/// Create a copy of Leg
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = freezed,Object? weight = freezed,Object? summary = freezed,Object? duration = freezed,Object? distance = freezed,}) {
  return _then(Leg(
steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Leg].
extension LegPatterns on Leg {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Leg value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Leg() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Leg value)  $default,){
final _that = this;
switch (_that) {
case _Leg():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Leg value)?  $default,){
final _that = this;
switch (_that) {
case _Leg() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "steps")  List<dynamic>? steps, @JsonKey(name: "weight")  double? weight, @JsonKey(name: "summary")  String? summary, @JsonKey(name: "duration")  int? duration, @JsonKey(name: "distance")  int? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Leg() when $default != null:
return $default(_that.steps,_that.weight,_that.summary,_that.duration,_that.distance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "steps")  List<dynamic>? steps, @JsonKey(name: "weight")  double? weight, @JsonKey(name: "summary")  String? summary, @JsonKey(name: "duration")  int? duration, @JsonKey(name: "distance")  int? distance)  $default,) {final _that = this;
switch (_that) {
case _Leg():
return $default(_that.steps,_that.weight,_that.summary,_that.duration,_that.distance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "steps")  List<dynamic>? steps, @JsonKey(name: "weight")  double? weight, @JsonKey(name: "summary")  String? summary, @JsonKey(name: "duration")  int? duration, @JsonKey(name: "distance")  int? distance)?  $default,) {final _that = this;
switch (_that) {
case _Leg() when $default != null:
return $default(_that.steps,_that.weight,_that.summary,_that.duration,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Leg implements Leg {
  const _Leg({@JsonKey(name: "steps")  List<dynamic>? steps, @JsonKey(name: "weight") this.weight, @JsonKey(name: "summary") this.summary, @JsonKey(name: "duration") this.duration, @JsonKey(name: "distance") this.distance}): _steps = steps;
  factory _Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);

 final  List<dynamic>? _steps;
@override@JsonKey(name: "steps") List<dynamic>? get steps {
  final value = _steps;
  if (value == null) return null;
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "weight") final  double? weight;
@override@JsonKey(name: "summary") final  String? summary;
@override@JsonKey(name: "duration") final  int? duration;
@override@JsonKey(name: "distance") final  int? distance;

/// Create a copy of Leg
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegCopyWith<_Leg> get copyWith => __$LegCopyWithImpl<_Leg>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Leg&&const DeepCollectionEquality().equals(other.steps, _steps)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_steps),weight,summary,duration,distance);
}

@override
String toString() {
    return 'Leg(steps: $steps, weight: $weight, summary: $summary, duration: $duration, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$LegCopyWith<$Res> implements $LegCopyWith<$Res> {
  factory _$LegCopyWith(_Leg value, $Res Function(_Leg) _then) = __$LegCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "steps") List<dynamic>? steps,@JsonKey(name: "weight") double? weight,@JsonKey(name: "summary") String? summary,@JsonKey(name: "duration") int? duration,@JsonKey(name: "distance") int? distance
});




}
/// @nodoc
class __$LegCopyWithImpl<$Res>
    implements _$LegCopyWith<$Res> {
  __$LegCopyWithImpl(this._self, this._then);

  final _Leg _self;
  final $Res Function(_Leg) _then;

/// Create a copy of Leg
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = freezed,Object? weight = freezed,Object? summary = freezed,Object? duration = freezed,Object? distance = freezed,}) {
  return _then(_Leg(
steps: freezed == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Waypoint {

@JsonKey(name: "hint") String? get hint;@JsonKey(name: "location") List<double>? get location;@JsonKey(name: "name") String? get name;@JsonKey(name: "distance") int? get distance;
/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaypointCopyWith<Waypoint> get copyWith => _$WaypointCopyWithImpl<Waypoint>(this as Waypoint, _$identity);

  /// Serializes this Waypoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Waypoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Waypoint&&(identical(other.hint, _this.hint) || other.hint == _this.hint)&&const DeepCollectionEquality().equals(other.location, _this.location)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.distance, _this.distance) || other.distance == _this.distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Waypoint;
  return Object.hash(runtimeType,_this.hint,const DeepCollectionEquality().hash(_this.location),_this.name,_this.distance);
}

@override
String toString() {
  final _this = this as Waypoint;
  return 'Waypoint(hint: ${_this.hint}, location: ${_this.location}, name: ${_this.name}, distance: ${_this.distance})';
}


}

/// @nodoc
abstract mixin class $WaypointCopyWith<$Res>  {
  factory $WaypointCopyWith(Waypoint value, $Res Function(Waypoint) _then) = _$WaypointCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "hint") String? hint,@JsonKey(name: "location") List<double>? location,@JsonKey(name: "name") String? name,@JsonKey(name: "distance") int? distance
});




}
/// @nodoc
class _$WaypointCopyWithImpl<$Res>
    implements $WaypointCopyWith<$Res> {
  _$WaypointCopyWithImpl(this._self, this._then);

  final Waypoint _self;
  final $Res Function(Waypoint) _then;

/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hint = freezed,Object? location = freezed,Object? name = freezed,Object? distance = freezed,}) {
  return _then(Waypoint(
hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<double>?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Waypoint].
extension WaypointPatterns on Waypoint {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Waypoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Waypoint value)  $default,){
final _that = this;
switch (_that) {
case _Waypoint():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Waypoint value)?  $default,){
final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "hint")  String? hint, @JsonKey(name: "location")  List<double>? location, @JsonKey(name: "name")  String? name, @JsonKey(name: "distance")  int? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
return $default(_that.hint,_that.location,_that.name,_that.distance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "hint")  String? hint, @JsonKey(name: "location")  List<double>? location, @JsonKey(name: "name")  String? name, @JsonKey(name: "distance")  int? distance)  $default,) {final _that = this;
switch (_that) {
case _Waypoint():
return $default(_that.hint,_that.location,_that.name,_that.distance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "hint")  String? hint, @JsonKey(name: "location")  List<double>? location, @JsonKey(name: "name")  String? name, @JsonKey(name: "distance")  int? distance)?  $default,) {final _that = this;
switch (_that) {
case _Waypoint() when $default != null:
return $default(_that.hint,_that.location,_that.name,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Waypoint implements Waypoint {
  const _Waypoint({@JsonKey(name: "hint") this.hint, @JsonKey(name: "location")  List<double>? location, @JsonKey(name: "name") this.name, @JsonKey(name: "distance") this.distance}): _location = location;
  factory _Waypoint.fromJson(Map<String, dynamic> json) => _$WaypointFromJson(json);

@override@JsonKey(name: "hint") final  String? hint;
 final  List<double>? _location;
@override@JsonKey(name: "location") List<double>? get location {
  final value = _location;
  if (value == null) return null;
  if (_location is EqualUnmodifiableListView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "distance") final  int? distance;

/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaypointCopyWith<_Waypoint> get copyWith => __$WaypointCopyWithImpl<_Waypoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaypointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Waypoint&&(identical(other.hint, hint) || other.hint == hint)&&const DeepCollectionEquality().equals(other.location, _location)&&(identical(other.name, name) || other.name == name)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,hint,const DeepCollectionEquality().hash(_location),name,distance);
}

@override
String toString() {
    return 'Waypoint(hint: $hint, location: $location, name: $name, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$WaypointCopyWith<$Res> implements $WaypointCopyWith<$Res> {
  factory _$WaypointCopyWith(_Waypoint value, $Res Function(_Waypoint) _then) = __$WaypointCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "hint") String? hint,@JsonKey(name: "location") List<double>? location,@JsonKey(name: "name") String? name,@JsonKey(name: "distance") int? distance
});




}
/// @nodoc
class __$WaypointCopyWithImpl<$Res>
    implements _$WaypointCopyWith<$Res> {
  __$WaypointCopyWithImpl(this._self, this._then);

  final _Waypoint _self;
  final $Res Function(_Waypoint) _then;

/// Create a copy of Waypoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hint = freezed,Object? location = freezed,Object? name = freezed,Object? distance = freezed,}) {
  return _then(_Waypoint(
hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<double>?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
