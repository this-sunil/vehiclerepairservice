// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SlotEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "totalPage") int? get totalPage;@JsonKey(name: "currentPage") int? get currentPage;@JsonKey(name: "prevPage") bool? get prevPage;@JsonKey(name: "nextPage") bool? get nextPage;@JsonKey(name: "result") List<Result>? get result;
/// Create a copy of SlotEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotEntityCopyWith<SlotEntity> get copyWith => _$SlotEntityCopyWithImpl<SlotEntity>(this as SlotEntity, _$identity);

  /// Serializes this SlotEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SlotEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&(identical(other.totalPage, _this.totalPage) || other.totalPage == _this.totalPage)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.prevPage, _this.prevPage) || other.prevPage == _this.prevPage)&&(identical(other.nextPage, _this.nextPage) || other.nextPage == _this.nextPage)&&const DeepCollectionEquality().equals(other.result, _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SlotEntity;
  return Object.hash(runtimeType,_this.status,_this.msg,_this.totalPage,_this.currentPage,_this.prevPage,_this.nextPage,const DeepCollectionEquality().hash(_this.result));
}

@override
String toString() {
  final _this = this as SlotEntity;
  return 'SlotEntity(status: ${_this.status}, msg: ${_this.msg}, totalPage: ${_this.totalPage}, currentPage: ${_this.currentPage}, prevPage: ${_this.prevPage}, nextPage: ${_this.nextPage}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $SlotEntityCopyWith<$Res>  {
  factory $SlotEntityCopyWith(SlotEntity value, $Res Function(SlotEntity) _then) = _$SlotEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "currentPage") int? currentPage,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage,@JsonKey(name: "result") List<Result>? result
});




}
/// @nodoc
class _$SlotEntityCopyWithImpl<$Res>
    implements $SlotEntityCopyWith<$Res> {
  _$SlotEntityCopyWithImpl(this._self, this._then);

  final SlotEntity _self;
  final $Res Function(SlotEntity) _then;

/// Create a copy of SlotEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? totalPage = freezed,Object? currentPage = freezed,Object? prevPage = freezed,Object? nextPage = freezed,Object? result = freezed,}) {
  return _then(SlotEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SlotEntity].
extension SlotEntityPatterns on SlotEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlotEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlotEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlotEntity value)  $default,){
final _that = this;
switch (_that) {
case _SlotEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlotEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SlotEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "currentPage")  int? currentPage, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage, @JsonKey(name: "result")  List<Result>? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlotEntity() when $default != null:
return $default(_that.status,_that.msg,_that.totalPage,_that.currentPage,_that.prevPage,_that.nextPage,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "currentPage")  int? currentPage, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage, @JsonKey(name: "result")  List<Result>? result)  $default,) {final _that = this;
switch (_that) {
case _SlotEntity():
return $default(_that.status,_that.msg,_that.totalPage,_that.currentPage,_that.prevPage,_that.nextPage,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "currentPage")  int? currentPage, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage, @JsonKey(name: "result")  List<Result>? result)?  $default,) {final _that = this;
switch (_that) {
case _SlotEntity() when $default != null:
return $default(_that.status,_that.msg,_that.totalPage,_that.currentPage,_that.prevPage,_that.nextPage,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SlotEntity implements SlotEntity {
  const _SlotEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "msg") this.msg, @JsonKey(name: "totalPage") this.totalPage, @JsonKey(name: "currentPage") this.currentPage, @JsonKey(name: "prevPage") this.prevPage, @JsonKey(name: "nextPage") this.nextPage, @JsonKey(name: "result")  List<Result>? result}): _result = result;
  factory _SlotEntity.fromJson(Map<String, dynamic> json) => _$SlotEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "msg") final  String? msg;
@override@JsonKey(name: "totalPage") final  int? totalPage;
@override@JsonKey(name: "currentPage") final  int? currentPage;
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


/// Create a copy of SlotEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotEntityCopyWith<_SlotEntity> get copyWith => __$SlotEntityCopyWithImpl<_SlotEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlotEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.totalPage, totalPage) || other.totalPage == totalPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage)&&const DeepCollectionEquality().equals(other.result, _result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,msg,totalPage,currentPage,prevPage,nextPage,const DeepCollectionEquality().hash(_result));
}

@override
String toString() {
    return 'SlotEntity(status: $status, msg: $msg, totalPage: $totalPage, currentPage: $currentPage, prevPage: $prevPage, nextPage: $nextPage, result: $result)';
}


}

/// @nodoc
abstract mixin class _$SlotEntityCopyWith<$Res> implements $SlotEntityCopyWith<$Res> {
  factory _$SlotEntityCopyWith(_SlotEntity value, $Res Function(_SlotEntity) _then) = __$SlotEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "currentPage") int? currentPage,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage,@JsonKey(name: "result") List<Result>? result
});




}
/// @nodoc
class __$SlotEntityCopyWithImpl<$Res>
    implements _$SlotEntityCopyWith<$Res> {
  __$SlotEntityCopyWithImpl(this._self, this._then);

  final _SlotEntity _self;
  final $Res Function(_SlotEntity) _then;

/// Create a copy of SlotEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? totalPage = freezed,Object? currentPage = freezed,Object? prevPage = freezed,Object? nextPage = freezed,Object? result = freezed,}) {
  return _then(_SlotEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,result: freezed == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,
  ));
}


}


/// @nodoc
mixin _$Result {

@JsonKey(name: "book_id") int? get bookId;@JsonKey(name: "uid") int? get uid;@JsonKey(name: "vehicle_name") String? get vehicleName;@JsonKey(name: "registration_no") String? get registrationNo;@JsonKey(name: "vehicle_photo") String? get vehiclePhoto;@JsonKey(name: "vehicle_type") String? get vehicleType;@JsonKey(name: "slot_date") String? get slotDate;@JsonKey(name: "slot_time") String? get slotTime;@JsonKey(name: "service_name") String? get serviceName;@JsonKey(name: "created_at") DateTime? get createdAt;
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
@JsonKey(name: "book_id") int? bookId,@JsonKey(name: "uid") int? uid,@JsonKey(name: "vehicle_name") String? vehicleName,@JsonKey(name: "registration_no") String? registrationNo,@JsonKey(name: "vehicle_photo") String? vehiclePhoto,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "slot_date") String? slotDate,@JsonKey(name: "slot_time") String? slotTime,@JsonKey(name: "service_name") String? serviceName,@JsonKey(name: "created_at") DateTime? createdAt
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
as String?,slotTime: freezed == slotTime ? _self.slotTime : slotTime // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "book_id")  int? bookId, @JsonKey(name: "uid")  int? uid, @JsonKey(name: "vehicle_name")  String? vehicleName, @JsonKey(name: "registration_no")  String? registrationNo, @JsonKey(name: "vehicle_photo")  String? vehiclePhoto, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "slot_date")  String? slotDate, @JsonKey(name: "slot_time")  String? slotTime, @JsonKey(name: "service_name")  String? serviceName, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "book_id")  int? bookId, @JsonKey(name: "uid")  int? uid, @JsonKey(name: "vehicle_name")  String? vehicleName, @JsonKey(name: "registration_no")  String? registrationNo, @JsonKey(name: "vehicle_photo")  String? vehiclePhoto, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "slot_date")  String? slotDate, @JsonKey(name: "slot_time")  String? slotTime, @JsonKey(name: "service_name")  String? serviceName, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "book_id")  int? bookId, @JsonKey(name: "uid")  int? uid, @JsonKey(name: "vehicle_name")  String? vehicleName, @JsonKey(name: "registration_no")  String? registrationNo, @JsonKey(name: "vehicle_photo")  String? vehiclePhoto, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "slot_date")  String? slotDate, @JsonKey(name: "slot_time")  String? slotTime, @JsonKey(name: "service_name")  String? serviceName, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
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
@override@JsonKey(name: "slot_date") final  String? slotDate;
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
@JsonKey(name: "book_id") int? bookId,@JsonKey(name: "uid") int? uid,@JsonKey(name: "vehicle_name") String? vehicleName,@JsonKey(name: "registration_no") String? registrationNo,@JsonKey(name: "vehicle_photo") String? vehiclePhoto,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "slot_date") String? slotDate,@JsonKey(name: "slot_time") String? slotTime,@JsonKey(name: "service_name") String? serviceName,@JsonKey(name: "created_at") DateTime? createdAt
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
as String?,slotTime: freezed == slotTime ? _self.slotTime : slotTime // ignore: cast_nullable_to_non_nullable
as String?,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
