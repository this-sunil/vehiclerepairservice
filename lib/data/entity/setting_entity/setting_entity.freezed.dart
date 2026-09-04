// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "result") Result? get result;
/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingEntityCopyWith<SettingEntity> get copyWith => _$SettingEntityCopyWithImpl<SettingEntity>(this as SettingEntity, _$identity);

  /// Serializes this SettingEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SettingEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&(identical(other.result, _this.result) || other.result == _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SettingEntity;
  return Object.hash(runtimeType,_this.status,_this.msg,_this.result);
}

@override
String toString() {
  final _this = this as SettingEntity;
  return 'SettingEntity(status: ${_this.status}, msg: ${_this.msg}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $SettingEntityCopyWith<$Res>  {
  factory $SettingEntityCopyWith(SettingEntity value, $Res Function(SettingEntity) _then) = _$SettingEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") Result? result
});


$ResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$SettingEntityCopyWithImpl<$Res>
    implements $SettingEntityCopyWith<$Res> {
  _$SettingEntityCopyWithImpl(this._self, this._then);

  final SettingEntity _self;
  final $Res Function(SettingEntity) _then;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? result = freezed,}) {
  return _then(SettingEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}
/// Create a copy of SettingEntity
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


/// Adds pattern-matching-related methods to [SettingEntity].
extension SettingEntityPatterns on SettingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingEntity value)  $default,){
final _that = this;
switch (_that) {
case _SettingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SettingEntity() when $default != null:
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
case _SettingEntity() when $default != null:
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
case _SettingEntity():
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
case _SettingEntity() when $default != null:
return $default(_that.status,_that.msg,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingEntity implements SettingEntity {
  const _SettingEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "msg") this.msg, @JsonKey(name: "result") this.result});
  factory _SettingEntity.fromJson(Map<String, dynamic> json) => _$SettingEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "msg") final  String? msg;
@override@JsonKey(name: "result") final  Result? result;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingEntityCopyWith<_SettingEntity> get copyWith => __$SettingEntityCopyWithImpl<_SettingEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,msg,result);
}

@override
String toString() {
    return 'SettingEntity(status: $status, msg: $msg, result: $result)';
}


}

/// @nodoc
abstract mixin class _$SettingEntityCopyWith<$Res> implements $SettingEntityCopyWith<$Res> {
  factory _$SettingEntityCopyWith(_SettingEntity value, $Res Function(_SettingEntity) _then) = __$SettingEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") Result? result
});


@override $ResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$SettingEntityCopyWithImpl<$Res>
    implements _$SettingEntityCopyWith<$Res> {
  __$SettingEntityCopyWithImpl(this._self, this._then);

  final _SettingEntity _self;
  final $Res Function(_SettingEntity) _then;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? result = freezed,}) {
  return _then(_SettingEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}

/// Create a copy of SettingEntity
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

@JsonKey(name: "sid") int? get sid;@JsonKey(name: "contact_url") String? get contactUrl;@JsonKey(name: "terms_condition_url") String? get termsConditionUrl;@JsonKey(name: "privacy_policy_url") String? get privacyPolicyUrl;@JsonKey(name: "photo") String? get photo;@JsonKey(name: "created_at") DateTime? get createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.sid, _this.sid) || other.sid == _this.sid)&&(identical(other.contactUrl, _this.contactUrl) || other.contactUrl == _this.contactUrl)&&(identical(other.termsConditionUrl, _this.termsConditionUrl) || other.termsConditionUrl == _this.termsConditionUrl)&&(identical(other.privacyPolicyUrl, _this.privacyPolicyUrl) || other.privacyPolicyUrl == _this.privacyPolicyUrl)&&(identical(other.photo, _this.photo) || other.photo == _this.photo)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Result;
  return Object.hash(runtimeType,_this.sid,_this.contactUrl,_this.termsConditionUrl,_this.privacyPolicyUrl,_this.photo,_this.createdAt);
}

@override
String toString() {
  final _this = this as Result;
  return 'Result(sid: ${_this.sid}, contactUrl: ${_this.contactUrl}, termsConditionUrl: ${_this.termsConditionUrl}, privacyPolicyUrl: ${_this.privacyPolicyUrl}, photo: ${_this.photo}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "sid") int? sid,@JsonKey(name: "contact_url") String? contactUrl,@JsonKey(name: "terms_condition_url") String? termsConditionUrl,@JsonKey(name: "privacy_policy_url") String? privacyPolicyUrl,@JsonKey(name: "photo") String? photo,@JsonKey(name: "created_at") DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? sid = freezed,Object? contactUrl = freezed,Object? termsConditionUrl = freezed,Object? privacyPolicyUrl = freezed,Object? photo = freezed,Object? createdAt = freezed,}) {
  return _then(Result(
sid: freezed == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as int?,contactUrl: freezed == contactUrl ? _self.contactUrl : contactUrl // ignore: cast_nullable_to_non_nullable
as String?,termsConditionUrl: freezed == termsConditionUrl ? _self.termsConditionUrl : termsConditionUrl // ignore: cast_nullable_to_non_nullable
as String?,privacyPolicyUrl: freezed == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "sid")  int? sid, @JsonKey(name: "contact_url")  String? contactUrl, @JsonKey(name: "terms_condition_url")  String? termsConditionUrl, @JsonKey(name: "privacy_policy_url")  String? privacyPolicyUrl, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.sid,_that.contactUrl,_that.termsConditionUrl,_that.privacyPolicyUrl,_that.photo,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "sid")  int? sid, @JsonKey(name: "contact_url")  String? contactUrl, @JsonKey(name: "terms_condition_url")  String? termsConditionUrl, @JsonKey(name: "privacy_policy_url")  String? privacyPolicyUrl, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.sid,_that.contactUrl,_that.termsConditionUrl,_that.privacyPolicyUrl,_that.photo,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "sid")  int? sid, @JsonKey(name: "contact_url")  String? contactUrl, @JsonKey(name: "terms_condition_url")  String? termsConditionUrl, @JsonKey(name: "privacy_policy_url")  String? privacyPolicyUrl, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.sid,_that.contactUrl,_that.termsConditionUrl,_that.privacyPolicyUrl,_that.photo,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({@JsonKey(name: "sid") this.sid, @JsonKey(name: "contact_url") this.contactUrl, @JsonKey(name: "terms_condition_url") this.termsConditionUrl, @JsonKey(name: "privacy_policy_url") this.privacyPolicyUrl, @JsonKey(name: "photo") this.photo, @JsonKey(name: "created_at") this.createdAt});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override@JsonKey(name: "sid") final  int? sid;
@override@JsonKey(name: "contact_url") final  String? contactUrl;
@override@JsonKey(name: "terms_condition_url") final  String? termsConditionUrl;
@override@JsonKey(name: "privacy_policy_url") final  String? privacyPolicyUrl;
@override@JsonKey(name: "photo") final  String? photo;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.sid, sid) || other.sid == sid)&&(identical(other.contactUrl, contactUrl) || other.contactUrl == contactUrl)&&(identical(other.termsConditionUrl, termsConditionUrl) || other.termsConditionUrl == termsConditionUrl)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sid,contactUrl,termsConditionUrl,privacyPolicyUrl,photo,createdAt);
}

@override
String toString() {
    return 'Result(sid: $sid, contactUrl: $contactUrl, termsConditionUrl: $termsConditionUrl, privacyPolicyUrl: $privacyPolicyUrl, photo: $photo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "sid") int? sid,@JsonKey(name: "contact_url") String? contactUrl,@JsonKey(name: "terms_condition_url") String? termsConditionUrl,@JsonKey(name: "privacy_policy_url") String? privacyPolicyUrl,@JsonKey(name: "photo") String? photo,@JsonKey(name: "created_at") DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? sid = freezed,Object? contactUrl = freezed,Object? termsConditionUrl = freezed,Object? privacyPolicyUrl = freezed,Object? photo = freezed,Object? createdAt = freezed,}) {
  return _then(_Result(
sid: freezed == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as int?,contactUrl: freezed == contactUrl ? _self.contactUrl : contactUrl // ignore: cast_nullable_to_non_nullable
as String?,termsConditionUrl: freezed == termsConditionUrl ? _self.termsConditionUrl : termsConditionUrl // ignore: cast_nullable_to_non_nullable
as String?,privacyPolicyUrl: freezed == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
