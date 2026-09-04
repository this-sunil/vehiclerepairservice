// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShopEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "currentPage") int? get currentPage;@JsonKey(name: "totalPage") int? get totalPage;@JsonKey(name: "result") List<Result>? get result;@JsonKey(name: "prevPage") bool? get prevPage;@JsonKey(name: "nextPage") bool? get nextPage;
/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopEntityCopyWith<ShopEntity> get copyWith => _$ShopEntityCopyWithImpl<ShopEntity>(this as ShopEntity, _$identity);

  /// Serializes this ShopEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShopEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.totalPage, _this.totalPage) || other.totalPage == _this.totalPage)&&const DeepCollectionEquality().equals(other.result, _this.result)&&(identical(other.prevPage, _this.prevPage) || other.prevPage == _this.prevPage)&&(identical(other.nextPage, _this.nextPage) || other.nextPage == _this.nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShopEntity;
  return Object.hash(runtimeType,_this.status,_this.msg,_this.currentPage,_this.totalPage,const DeepCollectionEquality().hash(_this.result),_this.prevPage,_this.nextPage);
}

@override
String toString() {
  final _this = this as ShopEntity;
  return 'ShopEntity(status: ${_this.status}, msg: ${_this.msg}, currentPage: ${_this.currentPage}, totalPage: ${_this.totalPage}, result: ${_this.result}, prevPage: ${_this.prevPage}, nextPage: ${_this.nextPage})';
}


}

/// @nodoc
abstract mixin class $ShopEntityCopyWith<$Res>  {
  factory $ShopEntityCopyWith(ShopEntity value, $Res Function(ShopEntity) _then) = _$ShopEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "currentPage") int? currentPage,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "result") List<Result>? result,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage
});




}
/// @nodoc
class _$ShopEntityCopyWithImpl<$Res>
    implements $ShopEntityCopyWith<$Res> {
  _$ShopEntityCopyWithImpl(this._self, this._then);

  final ShopEntity _self;
  final $Res Function(ShopEntity) _then;

/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? currentPage = freezed,Object? totalPage = freezed,Object? result = freezed,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(ShopEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopEntity].
extension ShopEntityPatterns on ShopEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopEntity value)  $default,){
final _that = this;
switch (_that) {
case _ShopEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "currentPage")  int? currentPage, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
return $default(_that.status,_that.msg,_that.currentPage,_that.totalPage,_that.result,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "currentPage")  int? currentPage, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage)  $default,) {final _that = this;
switch (_that) {
case _ShopEntity():
return $default(_that.status,_that.msg,_that.currentPage,_that.totalPage,_that.result,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "currentPage")  int? currentPage, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage)?  $default,) {final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
return $default(_that.status,_that.msg,_that.currentPage,_that.totalPage,_that.result,_that.prevPage,_that.nextPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopEntity implements ShopEntity {
  const _ShopEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "msg") this.msg, @JsonKey(name: "currentPage") this.currentPage, @JsonKey(name: "totalPage") this.totalPage, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage") this.prevPage, @JsonKey(name: "nextPage") this.nextPage}): _result = result;
  factory _ShopEntity.fromJson(Map<String, dynamic> json) => _$ShopEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "msg") final  String? msg;
@override@JsonKey(name: "currentPage") final  int? currentPage;
@override@JsonKey(name: "totalPage") final  int? totalPage;
 final  List<Result>? _result;
@override@JsonKey(name: "result") List<Result>? get result {
  final value = _result;
  if (value == null) return null;
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "prevPage") final  bool? prevPage;
@override@JsonKey(name: "nextPage") final  bool? nextPage;

/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopEntityCopyWith<_ShopEntity> get copyWith => __$ShopEntityCopyWithImpl<_ShopEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPage, totalPage) || other.totalPage == totalPage)&&const DeepCollectionEquality().equals(other.result, _result)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,msg,currentPage,totalPage,const DeepCollectionEquality().hash(_result),prevPage,nextPage);
}

@override
String toString() {
    return 'ShopEntity(status: $status, msg: $msg, currentPage: $currentPage, totalPage: $totalPage, result: $result, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class _$ShopEntityCopyWith<$Res> implements $ShopEntityCopyWith<$Res> {
  factory _$ShopEntityCopyWith(_ShopEntity value, $Res Function(_ShopEntity) _then) = __$ShopEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "currentPage") int? currentPage,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "result") List<Result>? result,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage
});




}
/// @nodoc
class __$ShopEntityCopyWithImpl<$Res>
    implements _$ShopEntityCopyWith<$Res> {
  __$ShopEntityCopyWithImpl(this._self, this._then);

  final _ShopEntity _self;
  final $Res Function(_ShopEntity) _then;

/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? currentPage = freezed,Object? totalPage = freezed,Object? result = freezed,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_ShopEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,result: freezed == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Result {

@JsonKey(name: "sid") int? get sid;@JsonKey(name: "shopname") String? get shopname;@JsonKey(name: "shopphoto") String? get shopphoto;@JsonKey(name: "shoptime") String? get shoptime;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "lat") double? get lat;@JsonKey(name: "long") double? get long;@JsonKey(name: "status") bool? get status;@JsonKey(name: "city") String? get city;@JsonKey(name: "created_at") DateTime? get createdAt;
/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultCopyWith<Result> get copyWith => _$ResultCopyWithImpl<Result>(this as Result, _$identity);

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Result;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.sid, _this.sid) || other.sid == _this.sid)&&(identical(other.shopname, _this.shopname) || other.shopname == _this.shopname)&&(identical(other.shopphoto, _this.shopphoto) || other.shopphoto == _this.shopphoto)&&(identical(other.shoptime, _this.shoptime) || other.shoptime == _this.shoptime)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.long, _this.long) || other.long == _this.long)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Result;
  return Object.hash(runtimeType,_this.sid,_this.shopname,_this.shopphoto,_this.shoptime,_this.phone,_this.lat,_this.long,_this.status,_this.city,_this.createdAt);
}

@override
String toString() {
  final _this = this as Result;
  return 'Result(sid: ${_this.sid}, shopname: ${_this.shopname}, shopphoto: ${_this.shopphoto}, shoptime: ${_this.shoptime}, phone: ${_this.phone}, lat: ${_this.lat}, long: ${_this.long}, status: ${_this.status}, city: ${_this.city}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "sid") int? sid,@JsonKey(name: "shopname") String? shopname,@JsonKey(name: "shopphoto") String? shopphoto,@JsonKey(name: "shoptime") String? shoptime,@JsonKey(name: "phone") String? phone,@JsonKey(name: "lat") double? lat,@JsonKey(name: "long") double? long,@JsonKey(name: "status") bool? status,@JsonKey(name: "city") String? city,@JsonKey(name: "created_at") DateTime? createdAt
});




}
/// @nodoc
class _$ResultCopyWithImpl<$Res>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._self, this._then);

  final Result _self;
  final $Res Function(Result) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sid = freezed,Object? shopname = freezed,Object? shopphoto = freezed,Object? shoptime = freezed,Object? phone = freezed,Object? lat = freezed,Object? long = freezed,Object? status = freezed,Object? city = freezed,Object? createdAt = freezed,}) {
  return _then(Result(
sid: freezed == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as int?,shopname: freezed == shopname ? _self.shopname : shopname // ignore: cast_nullable_to_non_nullable
as String?,shopphoto: freezed == shopphoto ? _self.shopphoto : shopphoto // ignore: cast_nullable_to_non_nullable
as String?,shoptime: freezed == shoptime ? _self.shoptime : shoptime // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,long: freezed == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns on Result {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Result value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Result() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Result value)  $default,){
final _that = this;
switch (_that) {
case _Result():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Result value)?  $default,){
final _that = this;
switch (_that) {
case _Result() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "sid")  int? sid, @JsonKey(name: "shopname")  String? shopname, @JsonKey(name: "shopphoto")  String? shopphoto, @JsonKey(name: "shoptime")  String? shoptime, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "lat")  double? lat, @JsonKey(name: "long")  double? long, @JsonKey(name: "status")  bool? status, @JsonKey(name: "city")  String? city, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.sid,_that.shopname,_that.shopphoto,_that.shoptime,_that.phone,_that.lat,_that.long,_that.status,_that.city,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "sid")  int? sid, @JsonKey(name: "shopname")  String? shopname, @JsonKey(name: "shopphoto")  String? shopphoto, @JsonKey(name: "shoptime")  String? shoptime, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "lat")  double? lat, @JsonKey(name: "long")  double? long, @JsonKey(name: "status")  bool? status, @JsonKey(name: "city")  String? city, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.sid,_that.shopname,_that.shopphoto,_that.shoptime,_that.phone,_that.lat,_that.long,_that.status,_that.city,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "sid")  int? sid, @JsonKey(name: "shopname")  String? shopname, @JsonKey(name: "shopphoto")  String? shopphoto, @JsonKey(name: "shoptime")  String? shoptime, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "lat")  double? lat, @JsonKey(name: "long")  double? long, @JsonKey(name: "status")  bool? status, @JsonKey(name: "city")  String? city, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.sid,_that.shopname,_that.shopphoto,_that.shoptime,_that.phone,_that.lat,_that.long,_that.status,_that.city,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({@JsonKey(name: "sid") this.sid, @JsonKey(name: "shopname") this.shopname, @JsonKey(name: "shopphoto") this.shopphoto, @JsonKey(name: "shoptime") this.shoptime, @JsonKey(name: "phone") this.phone, @JsonKey(name: "lat") this.lat, @JsonKey(name: "long") this.long, @JsonKey(name: "status") this.status, @JsonKey(name: "city") this.city, @JsonKey(name: "created_at") this.createdAt});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override@JsonKey(name: "sid") final  int? sid;
@override@JsonKey(name: "shopname") final  String? shopname;
@override@JsonKey(name: "shopphoto") final  String? shopphoto;
@override@JsonKey(name: "shoptime") final  String? shoptime;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "lat") final  double? lat;
@override@JsonKey(name: "long") final  double? long;
@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "city") final  String? city;
@override@JsonKey(name: "created_at") final  DateTime? createdAt;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultCopyWith<_Result> get copyWith => __$ResultCopyWithImpl<_Result>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.sid, sid) || other.sid == sid)&&(identical(other.shopname, shopname) || other.shopname == shopname)&&(identical(other.shopphoto, shopphoto) || other.shopphoto == shopphoto)&&(identical(other.shoptime, shoptime) || other.shoptime == shoptime)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long)&&(identical(other.status, status) || other.status == status)&&(identical(other.city, city) || other.city == city)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sid,shopname,shopphoto,shoptime,phone,lat,long,status,city,createdAt);
}

@override
String toString() {
    return 'Result(sid: $sid, shopname: $shopname, shopphoto: $shopphoto, shoptime: $shoptime, phone: $phone, lat: $lat, long: $long, status: $status, city: $city, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "sid") int? sid,@JsonKey(name: "shopname") String? shopname,@JsonKey(name: "shopphoto") String? shopphoto,@JsonKey(name: "shoptime") String? shoptime,@JsonKey(name: "phone") String? phone,@JsonKey(name: "lat") double? lat,@JsonKey(name: "long") double? long,@JsonKey(name: "status") bool? status,@JsonKey(name: "city") String? city,@JsonKey(name: "created_at") DateTime? createdAt
});




}
/// @nodoc
class __$ResultCopyWithImpl<$Res>
    implements _$ResultCopyWith<$Res> {
  __$ResultCopyWithImpl(this._self, this._then);

  final _Result _self;
  final $Res Function(_Result) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sid = freezed,Object? shopname = freezed,Object? shopphoto = freezed,Object? shoptime = freezed,Object? phone = freezed,Object? lat = freezed,Object? long = freezed,Object? status = freezed,Object? city = freezed,Object? createdAt = freezed,}) {
  return _then(_Result(
sid: freezed == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as int?,shopname: freezed == shopname ? _self.shopname : shopname // ignore: cast_nullable_to_non_nullable
as String?,shopphoto: freezed == shopphoto ? _self.shopphoto : shopphoto // ignore: cast_nullable_to_non_nullable
as String?,shoptime: freezed == shoptime ? _self.shoptime : shoptime // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,long: freezed == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
