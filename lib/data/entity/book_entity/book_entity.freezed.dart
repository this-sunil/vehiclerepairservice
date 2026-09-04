// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "result") Result? get result;
/// Create a copy of BookEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookEntityCopyWith<BookEntity> get copyWith => _$BookEntityCopyWithImpl<BookEntity>(this as BookEntity, _$identity);

  /// Serializes this BookEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&(identical(other.result, _this.result) || other.result == _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookEntity;
  return Object.hash(runtimeType,_this.status,_this.msg,_this.result);
}

@override
String toString() {
  final _this = this as BookEntity;
  return 'BookEntity(status: ${_this.status}, msg: ${_this.msg}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $BookEntityCopyWith<$Res>  {
  factory $BookEntityCopyWith(BookEntity value, $Res Function(BookEntity) _then) = _$BookEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") Result? result
});


$ResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$BookEntityCopyWithImpl<$Res>
    implements $BookEntityCopyWith<$Res> {
  _$BookEntityCopyWithImpl(this._self, this._then);

  final BookEntity _self;
  final $Res Function(BookEntity) _then;

/// Create a copy of BookEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? result = freezed,}) {
  return _then(BookEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}
/// Create a copy of BookEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookEntity].
extension BookEntityPatterns on BookEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  Result? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookEntity() when $default != null:
return $default(_that.status,_that.msg,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  Result? result)  $default,) {final _that = this;
switch (_that) {
case _BookEntity():
return $default(_that.status,_that.msg,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  Result? result)?  $default,) {final _that = this;
switch (_that) {
case _BookEntity() when $default != null:
return $default(_that.status,_that.msg,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookEntity implements BookEntity {
  const _BookEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "msg") this.msg, @JsonKey(name: "result") this.result});
  factory _BookEntity.fromJson(Map<String, dynamic> json) => _$BookEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "msg") final  String? msg;
@override@JsonKey(name: "result") final  Result? result;

/// Create a copy of BookEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookEntityCopyWith<_BookEntity> get copyWith => __$BookEntityCopyWithImpl<_BookEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,msg,result);
}

@override
String toString() {
    return 'BookEntity(status: $status, msg: $msg, result: $result)';
}


}

/// @nodoc
abstract mixin class _$BookEntityCopyWith<$Res> implements $BookEntityCopyWith<$Res> {
  factory _$BookEntityCopyWith(_BookEntity value, $Res Function(_BookEntity) _then) = __$BookEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") Result? result
});


@override $ResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$BookEntityCopyWithImpl<$Res>
    implements _$BookEntityCopyWith<$Res> {
  __$BookEntityCopyWithImpl(this._self, this._then);

  final _BookEntity _self;
  final $Res Function(_BookEntity) _then;

/// Create a copy of BookEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? result = freezed,}) {
  return _then(_BookEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}

/// Create a copy of BookEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// @nodoc
mixin _$Result {

@JsonKey(name: "book_id") int? get bookId;@JsonKey(name: "uid") int? get uid;@JsonKey(name: "vehicle_name") String? get vehicleName;@JsonKey(name: "registration_no") String? get registrationNo;@JsonKey(name: "vehicle_photo") String? get vehiclePhoto;@JsonKey(name: "vehicle_type") String? get vehicleType;@JsonKey(name: "slot_date") DateTime? get slotDate;@JsonKey(name: "slot_time") String? get slotTime;@JsonKey(name: "service_name") String? get serviceName;@JsonKey(name: "created_at") DateTime? get createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.bookId, _this.bookId) || other.bookId == _this.bookId)&&(identical(other.uid, _this.uid) || other.uid == _this.uid)&&(identical(other.vehicleName, _this.vehicleName) || other.vehicleName == _this.vehicleName)&&(identical(other.registrationNo, _this.registrationNo) || other.registrationNo == _this.registrationNo)&&(identical(other.vehiclePhoto, _this.vehiclePhoto) || other.vehiclePhoto == _this.vehiclePhoto)&&(identical(other.vehicleType, _this.vehicleType) || other.vehicleType == _this.vehicleType)&&(identical(other.slotDate, _this.slotDate) || other.slotDate == _this.slotDate)&&(identical(other.slotTime, _this.slotTime) || other.slotTime == _this.slotTime)&&(identical(other.serviceName, _this.serviceName) || other.serviceName == _this.serviceName)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Result;
  return Object.hash(runtimeType,_this.bookId,_this.uid,_this.vehicleName,_this.registrationNo,_this.vehiclePhoto,_this.vehicleType,_this.slotDate,_this.slotTime,_this.serviceName,_this.createdAt);
}

@override
String toString() {
  final _this = this as Result;
  return 'Result(bookId: ${_this.bookId}, uid: ${_this.uid}, vehicleName: ${_this.vehicleName}, registrationNo: ${_this.registrationNo}, vehiclePhoto: ${_this.vehiclePhoto}, vehicleType: ${_this.vehicleType}, slotDate: ${_this.slotDate}, slotTime: ${_this.slotTime}, serviceName: ${_this.serviceName}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "book_id") int? bookId,@JsonKey(name: "uid") int? uid,@JsonKey(name: "vehicle_name") String? vehicleName,@JsonKey(name: "registration_no") String? registrationNo,@JsonKey(name: "vehicle_photo") String? vehiclePhoto,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "slot_date") DateTime? slotDate,@JsonKey(name: "slot_time") String? slotTime,@JsonKey(name: "service_name") String? serviceName,@JsonKey(name: "created_at") DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = freezed,Object? uid = freezed,Object? vehicleName = freezed,Object? registrationNo = freezed,Object? vehiclePhoto = freezed,Object? vehicleType = freezed,Object? slotDate = freezed,Object? slotTime = freezed,Object? serviceName = freezed,Object? createdAt = freezed,}) {
  return _then(Result(
bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,vehicleName: freezed == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String?,registrationNo: freezed == registrationNo ? _self.registrationNo : registrationNo // ignore: cast_nullable_to_non_nullable
as String?,vehiclePhoto: freezed == vehiclePhoto ? _self.vehiclePhoto : vehiclePhoto // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as DateTime?,slotTime: freezed == slotTime ? _self.slotTime : slotTime // ignore: cast_nullable_to_non_nullable
as String?,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "book_id")  int? bookId, @JsonKey(name: "uid")  int? uid, @JsonKey(name: "vehicle_name")  String? vehicleName, @JsonKey(name: "registration_no")  String? registrationNo, @JsonKey(name: "vehicle_photo")  String? vehiclePhoto, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "slot_date")  DateTime? slotDate, @JsonKey(name: "slot_time")  String? slotTime, @JsonKey(name: "service_name")  String? serviceName, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.bookId,_that.uid,_that.vehicleName,_that.registrationNo,_that.vehiclePhoto,_that.vehicleType,_that.slotDate,_that.slotTime,_that.serviceName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "book_id")  int? bookId, @JsonKey(name: "uid")  int? uid, @JsonKey(name: "vehicle_name")  String? vehicleName, @JsonKey(name: "registration_no")  String? registrationNo, @JsonKey(name: "vehicle_photo")  String? vehiclePhoto, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "slot_date")  DateTime? slotDate, @JsonKey(name: "slot_time")  String? slotTime, @JsonKey(name: "service_name")  String? serviceName, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.bookId,_that.uid,_that.vehicleName,_that.registrationNo,_that.vehiclePhoto,_that.vehicleType,_that.slotDate,_that.slotTime,_that.serviceName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "book_id")  int? bookId, @JsonKey(name: "uid")  int? uid, @JsonKey(name: "vehicle_name")  String? vehicleName, @JsonKey(name: "registration_no")  String? registrationNo, @JsonKey(name: "vehicle_photo")  String? vehiclePhoto, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "slot_date")  DateTime? slotDate, @JsonKey(name: "slot_time")  String? slotTime, @JsonKey(name: "service_name")  String? serviceName, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.bookId,_that.uid,_that.vehicleName,_that.registrationNo,_that.vehiclePhoto,_that.vehicleType,_that.slotDate,_that.slotTime,_that.serviceName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({@JsonKey(name: "book_id") this.bookId, @JsonKey(name: "uid") this.uid, @JsonKey(name: "vehicle_name") this.vehicleName, @JsonKey(name: "registration_no") this.registrationNo, @JsonKey(name: "vehicle_photo") this.vehiclePhoto, @JsonKey(name: "vehicle_type") this.vehicleType, @JsonKey(name: "slot_date") this.slotDate, @JsonKey(name: "slot_time") this.slotTime, @JsonKey(name: "service_name") this.serviceName, @JsonKey(name: "created_at") this.createdAt});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override@JsonKey(name: "book_id") final  int? bookId;
@override@JsonKey(name: "uid") final  int? uid;
@override@JsonKey(name: "vehicle_name") final  String? vehicleName;
@override@JsonKey(name: "registration_no") final  String? registrationNo;
@override@JsonKey(name: "vehicle_photo") final  String? vehiclePhoto;
@override@JsonKey(name: "vehicle_type") final  String? vehicleType;
@override@JsonKey(name: "slot_date") final  DateTime? slotDate;
@override@JsonKey(name: "slot_time") final  String? slotTime;
@override@JsonKey(name: "service_name") final  String? serviceName;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.registrationNo, registrationNo) || other.registrationNo == registrationNo)&&(identical(other.vehiclePhoto, vehiclePhoto) || other.vehiclePhoto == vehiclePhoto)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.slotDate, slotDate) || other.slotDate == slotDate)&&(identical(other.slotTime, slotTime) || other.slotTime == slotTime)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bookId,uid,vehicleName,registrationNo,vehiclePhoto,vehicleType,slotDate,slotTime,serviceName,createdAt);
}

@override
String toString() {
    return 'Result(bookId: $bookId, uid: $uid, vehicleName: $vehicleName, registrationNo: $registrationNo, vehiclePhoto: $vehiclePhoto, vehicleType: $vehicleType, slotDate: $slotDate, slotTime: $slotTime, serviceName: $serviceName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "book_id") int? bookId,@JsonKey(name: "uid") int? uid,@JsonKey(name: "vehicle_name") String? vehicleName,@JsonKey(name: "registration_no") String? registrationNo,@JsonKey(name: "vehicle_photo") String? vehiclePhoto,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "slot_date") DateTime? slotDate,@JsonKey(name: "slot_time") String? slotTime,@JsonKey(name: "service_name") String? serviceName,@JsonKey(name: "created_at") DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = freezed,Object? uid = freezed,Object? vehicleName = freezed,Object? registrationNo = freezed,Object? vehiclePhoto = freezed,Object? vehicleType = freezed,Object? slotDate = freezed,Object? slotTime = freezed,Object? serviceName = freezed,Object? createdAt = freezed,}) {
  return _then(_Result(
bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,vehicleName: freezed == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String?,registrationNo: freezed == registrationNo ? _self.registrationNo : registrationNo // ignore: cast_nullable_to_non_nullable
as String?,vehiclePhoto: freezed == vehiclePhoto ? _self.vehiclePhoto : vehiclePhoto // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,slotDate: freezed == slotDate ? _self.slotDate : slotDate // ignore: cast_nullable_to_non_nullable
as DateTime?,slotTime: freezed == slotTime ? _self.slotTime : slotTime // ignore: cast_nullable_to_non_nullable
as String?,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
