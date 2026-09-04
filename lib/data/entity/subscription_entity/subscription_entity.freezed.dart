// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "result") List<Result>? get result;
/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionEntityCopyWith<SubscriptionEntity> get copyWith => _$SubscriptionEntityCopyWithImpl<SubscriptionEntity>(this as SubscriptionEntity, _$identity);

  /// Serializes this SubscriptionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubscriptionEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&const DeepCollectionEquality().equals(other.result, _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubscriptionEntity;
  return Object.hash(runtimeType,_this.status,_this.msg,const DeepCollectionEquality().hash(_this.result));
}

@override
String toString() {
  final _this = this as SubscriptionEntity;
  return 'SubscriptionEntity(status: ${_this.status}, msg: ${_this.msg}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $SubscriptionEntityCopyWith<$Res>  {
  factory $SubscriptionEntityCopyWith(SubscriptionEntity value, $Res Function(SubscriptionEntity) _then) = _$SubscriptionEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") List<Result>? result
});




}
/// @nodoc
class _$SubscriptionEntityCopyWithImpl<$Res>
    implements $SubscriptionEntityCopyWith<$Res> {
  _$SubscriptionEntityCopyWithImpl(this._self, this._then);

  final SubscriptionEntity _self;
  final $Res Function(SubscriptionEntity) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? result = freezed,}) {
  return _then(SubscriptionEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionEntity].
extension SubscriptionEntityPatterns on SubscriptionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionEntity value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  List<Result>? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  List<Result>? result)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  List<Result>? result)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionEntity() when $default != null:
return $default(_that.status,_that.msg,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionEntity implements SubscriptionEntity {
  const _SubscriptionEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "msg") this.msg, @JsonKey(name: "result")  List<Result>? result}): _result = result;
  factory _SubscriptionEntity.fromJson(Map<String, dynamic> json) => _$SubscriptionEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "msg") final  String? msg;
 final  List<Result>? _result;
@override@JsonKey(name: "result") List<Result>? get result {
  final value = _result;
  if (value == null) return null;
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionEntityCopyWith<_SubscriptionEntity> get copyWith => __$SubscriptionEntityCopyWithImpl<_SubscriptionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other.result, _result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,msg,const DeepCollectionEquality().hash(_result));
}

@override
String toString() {
    return 'SubscriptionEntity(status: $status, msg: $msg, result: $result)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionEntityCopyWith<$Res> implements $SubscriptionEntityCopyWith<$Res> {
  factory _$SubscriptionEntityCopyWith(_SubscriptionEntity value, $Res Function(_SubscriptionEntity) _then) = __$SubscriptionEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") List<Result>? result
});




}
/// @nodoc
class __$SubscriptionEntityCopyWithImpl<$Res>
    implements _$SubscriptionEntityCopyWith<$Res> {
  __$SubscriptionEntityCopyWithImpl(this._self, this._then);

  final _SubscriptionEntity _self;
  final $Res Function(_SubscriptionEntity) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? result = freezed,}) {
  return _then(_SubscriptionEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,
  ));
}


}


/// @nodoc
mixin _$Result {

@JsonKey(name: "pid") int? get pid;@JsonKey(name: "plan_title") String? get planTitle;@JsonKey(name: "plan_type") String? get planType;@JsonKey(name: "plan_price") int? get planPrice;@JsonKey(name: "created_at") DateTime? get createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.pid, _this.pid) || other.pid == _this.pid)&&(identical(other.planTitle, _this.planTitle) || other.planTitle == _this.planTitle)&&(identical(other.planType, _this.planType) || other.planType == _this.planType)&&(identical(other.planPrice, _this.planPrice) || other.planPrice == _this.planPrice)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Result;
  return Object.hash(runtimeType,_this.pid,_this.planTitle,_this.planType,_this.planPrice,_this.createdAt);
}

@override
String toString() {
  final _this = this as Result;
  return 'Result(pid: ${_this.pid}, planTitle: ${_this.planTitle}, planType: ${_this.planType}, planPrice: ${_this.planPrice}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "pid") int? pid,@JsonKey(name: "plan_title") String? planTitle,@JsonKey(name: "plan_type") String? planType,@JsonKey(name: "plan_price") int? planPrice,@JsonKey(name: "created_at") DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? pid = freezed,Object? planTitle = freezed,Object? planType = freezed,Object? planPrice = freezed,Object? createdAt = freezed,}) {
  return _then(Result(
pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,planTitle: freezed == planTitle ? _self.planTitle : planTitle // ignore: cast_nullable_to_non_nullable
as String?,planType: freezed == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as String?,planPrice: freezed == planPrice ? _self.planPrice : planPrice // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "pid")  int? pid, @JsonKey(name: "plan_title")  String? planTitle, @JsonKey(name: "plan_type")  String? planType, @JsonKey(name: "plan_price")  int? planPrice, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.pid,_that.planTitle,_that.planType,_that.planPrice,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "pid")  int? pid, @JsonKey(name: "plan_title")  String? planTitle, @JsonKey(name: "plan_type")  String? planType, @JsonKey(name: "plan_price")  int? planPrice, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.pid,_that.planTitle,_that.planType,_that.planPrice,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "pid")  int? pid, @JsonKey(name: "plan_title")  String? planTitle, @JsonKey(name: "plan_type")  String? planType, @JsonKey(name: "plan_price")  int? planPrice, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.pid,_that.planTitle,_that.planType,_that.planPrice,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({@JsonKey(name: "pid") this.pid, @JsonKey(name: "plan_title") this.planTitle, @JsonKey(name: "plan_type") this.planType, @JsonKey(name: "plan_price") this.planPrice, @JsonKey(name: "created_at") this.createdAt});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override@JsonKey(name: "pid") final  int? pid;
@override@JsonKey(name: "plan_title") final  String? planTitle;
@override@JsonKey(name: "plan_type") final  String? planType;
@override@JsonKey(name: "plan_price") final  int? planPrice;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.planTitle, planTitle) || other.planTitle == planTitle)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.planPrice, planPrice) || other.planPrice == planPrice)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,pid,planTitle,planType,planPrice,createdAt);
}

@override
String toString() {
    return 'Result(pid: $pid, planTitle: $planTitle, planType: $planType, planPrice: $planPrice, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "pid") int? pid,@JsonKey(name: "plan_title") String? planTitle,@JsonKey(name: "plan_type") String? planType,@JsonKey(name: "plan_price") int? planPrice,@JsonKey(name: "created_at") DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? pid = freezed,Object? planTitle = freezed,Object? planType = freezed,Object? planPrice = freezed,Object? createdAt = freezed,}) {
  return _then(_Result(
pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,planTitle: freezed == planTitle ? _self.planTitle : planTitle // ignore: cast_nullable_to_non_nullable
as String?,planType: freezed == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as String?,planPrice: freezed == planPrice ? _self.planPrice : planPrice // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
