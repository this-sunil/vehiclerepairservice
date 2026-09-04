// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "page") int? get page;@JsonKey(name: "totalPage") int? get totalPage;@JsonKey(name: "prevPage") bool? get prevPage;@JsonKey(name: "nextPage") bool? get nextPage;@JsonKey(name: "result") List<Result>? get result;
/// Create a copy of CatEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatEntityCopyWith<CatEntity> get copyWith => _$CatEntityCopyWithImpl<CatEntity>(this as CatEntity, _$identity);

  /// Serializes this CatEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.totalPage, _this.totalPage) || other.totalPage == _this.totalPage)&&(identical(other.prevPage, _this.prevPage) || other.prevPage == _this.prevPage)&&(identical(other.nextPage, _this.nextPage) || other.nextPage == _this.nextPage)&&const DeepCollectionEquality().equals(other.result, _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatEntity;
  return Object.hash(runtimeType,_this.status,_this.msg,_this.page,_this.totalPage,_this.prevPage,_this.nextPage,const DeepCollectionEquality().hash(_this.result));
}

@override
String toString() {
  final _this = this as CatEntity;
  return 'CatEntity(status: ${_this.status}, msg: ${_this.msg}, page: ${_this.page}, totalPage: ${_this.totalPage}, prevPage: ${_this.prevPage}, nextPage: ${_this.nextPage}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $CatEntityCopyWith<$Res>  {
  factory $CatEntityCopyWith(CatEntity value, $Res Function(CatEntity) _then) = _$CatEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "page") int? page,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage,@JsonKey(name: "result") List<Result>? result
});




}
/// @nodoc
class _$CatEntityCopyWithImpl<$Res>
    implements $CatEntityCopyWith<$Res> {
  _$CatEntityCopyWithImpl(this._self, this._then);

  final CatEntity _self;
  final $Res Function(CatEntity) _then;

/// Create a copy of CatEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? page = freezed,Object? totalPage = freezed,Object? prevPage = freezed,Object? nextPage = freezed,Object? result = freezed,}) {
  return _then(CatEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatEntity].
extension CatEntityPatterns on CatEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatEntity value)  $default,){
final _that = this;
switch (_that) {
case _CatEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CatEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "page")  int? page, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage, @JsonKey(name: "result")  List<Result>? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatEntity() when $default != null:
return $default(_that.status,_that.msg,_that.page,_that.totalPage,_that.prevPage,_that.nextPage,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "page")  int? page, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage, @JsonKey(name: "result")  List<Result>? result)  $default,) {final _that = this;
switch (_that) {
case _CatEntity():
return $default(_that.status,_that.msg,_that.page,_that.totalPage,_that.prevPage,_that.nextPage,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "page")  int? page, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage, @JsonKey(name: "result")  List<Result>? result)?  $default,) {final _that = this;
switch (_that) {
case _CatEntity() when $default != null:
return $default(_that.status,_that.msg,_that.page,_that.totalPage,_that.prevPage,_that.nextPage,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatEntity implements CatEntity {
  const _CatEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "msg") this.msg, @JsonKey(name: "page") this.page, @JsonKey(name: "totalPage") this.totalPage, @JsonKey(name: "prevPage") this.prevPage, @JsonKey(name: "nextPage") this.nextPage, @JsonKey(name: "result")  List<Result>? result}): _result = result;
  factory _CatEntity.fromJson(Map<String, dynamic> json) => _$CatEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "msg") final  String? msg;
@override@JsonKey(name: "page") final  int? page;
@override@JsonKey(name: "totalPage") final  int? totalPage;
@override@JsonKey(name: "prevPage") final  bool? prevPage;
@override@JsonKey(name: "nextPage") final  bool? nextPage;
 final  List<Result>? _result;
@override@JsonKey(name: "result") List<Result>? get result {
  final value = _result;
  if (value == null) return null;
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CatEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatEntityCopyWith<_CatEntity> get copyWith => __$CatEntityCopyWithImpl<_CatEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPage, totalPage) || other.totalPage == totalPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage)&&const DeepCollectionEquality().equals(other.result, _result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,msg,page,totalPage,prevPage,nextPage,const DeepCollectionEquality().hash(_result));
}

@override
String toString() {
    return 'CatEntity(status: $status, msg: $msg, page: $page, totalPage: $totalPage, prevPage: $prevPage, nextPage: $nextPage, result: $result)';
}


}

/// @nodoc
abstract mixin class _$CatEntityCopyWith<$Res> implements $CatEntityCopyWith<$Res> {
  factory _$CatEntityCopyWith(_CatEntity value, $Res Function(_CatEntity) _then) = __$CatEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "page") int? page,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage,@JsonKey(name: "result") List<Result>? result
});




}
/// @nodoc
class __$CatEntityCopyWithImpl<$Res>
    implements _$CatEntityCopyWith<$Res> {
  __$CatEntityCopyWithImpl(this._self, this._then);

  final _CatEntity _self;
  final $Res Function(_CatEntity) _then;

/// Create a copy of CatEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? page = freezed,Object? totalPage = freezed,Object? prevPage = freezed,Object? nextPage = freezed,Object? result = freezed,}) {
  return _then(_CatEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,result: freezed == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,
  ));
}


}


/// @nodoc
mixin _$Result {

@JsonKey(name: "cid") int? get cid;@JsonKey(name: "title") String? get title;@JsonKey(name: "photo") String? get photo;@JsonKey(name: "vehicle_type") String? get vehicleType;@JsonKey(name: "created_at") DateTime? get createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.cid, _this.cid) || other.cid == _this.cid)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.photo, _this.photo) || other.photo == _this.photo)&&(identical(other.vehicleType, _this.vehicleType) || other.vehicleType == _this.vehicleType)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Result;
  return Object.hash(runtimeType,_this.cid,_this.title,_this.photo,_this.vehicleType,_this.createdAt);
}

@override
String toString() {
  final _this = this as Result;
  return 'Result(cid: ${_this.cid}, title: ${_this.title}, photo: ${_this.photo}, vehicleType: ${_this.vehicleType}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "cid") int? cid,@JsonKey(name: "title") String? title,@JsonKey(name: "photo") String? photo,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "created_at") DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? cid = freezed,Object? title = freezed,Object? photo = freezed,Object? vehicleType = freezed,Object? createdAt = freezed,}) {
  return _then(Result(
cid: freezed == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "cid")  int? cid, @JsonKey(name: "title")  String? title, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.cid,_that.title,_that.photo,_that.vehicleType,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "cid")  int? cid, @JsonKey(name: "title")  String? title, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.cid,_that.title,_that.photo,_that.vehicleType,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "cid")  int? cid, @JsonKey(name: "title")  String? title, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.cid,_that.title,_that.photo,_that.vehicleType,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({@JsonKey(name: "cid") this.cid, @JsonKey(name: "title") this.title, @JsonKey(name: "photo") this.photo, @JsonKey(name: "vehicle_type") this.vehicleType, @JsonKey(name: "created_at") this.createdAt});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override@JsonKey(name: "cid") final  int? cid;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "photo") final  String? photo;
@override@JsonKey(name: "vehicle_type") final  String? vehicleType;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.title, title) || other.title == title)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,cid,title,photo,vehicleType,createdAt);
}

@override
String toString() {
    return 'Result(cid: $cid, title: $title, photo: $photo, vehicleType: $vehicleType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "cid") int? cid,@JsonKey(name: "title") String? title,@JsonKey(name: "photo") String? photo,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "created_at") DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? cid = freezed,Object? title = freezed,Object? photo = freezed,Object? vehicleType = freezed,Object? createdAt = freezed,}) {
  return _then(_Result(
cid: freezed == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
