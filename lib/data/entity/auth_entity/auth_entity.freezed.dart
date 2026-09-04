// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "token") String? get token;@JsonKey(name: "result") Result? get result;
/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEntityCopyWith<AuthEntity> get copyWith => _$AuthEntityCopyWithImpl<AuthEntity>(this as AuthEntity, _$identity);

  /// Serializes this AuthEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuthEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.result, _this.result) || other.result == _this.result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuthEntity;
  return Object.hash(runtimeType,_this.status,_this.msg,_this.token,_this.result);
}

@override
String toString() {
  final _this = this as AuthEntity;
  return 'AuthEntity(status: ${_this.status}, msg: ${_this.msg}, token: ${_this.token}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $AuthEntityCopyWith<$Res>  {
  factory $AuthEntityCopyWith(AuthEntity value, $Res Function(AuthEntity) _then) = _$AuthEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "token") String? token,@JsonKey(name: "result") Result? result
});


$ResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$AuthEntityCopyWithImpl<$Res>
    implements $AuthEntityCopyWith<$Res> {
  _$AuthEntityCopyWithImpl(this._self, this._then);

  final AuthEntity _self;
  final $Res Function(AuthEntity) _then;

/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? msg = freezed,Object? token = freezed,Object? result = freezed,}) {
  return _then(AuthEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}
/// Create a copy of AuthEntity
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


/// Adds pattern-matching-related methods to [AuthEntity].
extension AuthEntityPatterns on AuthEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthEntity value)  $default,){
final _that = this;
switch (_that) {
case _AuthEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "token")  String? token, @JsonKey(name: "result")  Result? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
return $default(_that.status,_that.msg,_that.token,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "token")  String? token, @JsonKey(name: "result")  Result? result)  $default,) {final _that = this;
switch (_that) {
case _AuthEntity():
return $default(_that.status,_that.msg,_that.token,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "token")  String? token, @JsonKey(name: "result")  Result? result)?  $default,) {final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
return $default(_that.status,_that.msg,_that.token,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthEntity implements AuthEntity {
  const _AuthEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "msg") this.msg, @JsonKey(name: "token") this.token, @JsonKey(name: "result") this.result});
  factory _AuthEntity.fromJson(Map<String, dynamic> json) => _$AuthEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "msg") final  String? msg;
@override@JsonKey(name: "token") final  String? token;
@override@JsonKey(name: "result") final  Result? result;

/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthEntityCopyWith<_AuthEntity> get copyWith => __$AuthEntityCopyWithImpl<_AuthEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.token, token) || other.token == token)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,msg,token,result);
}

@override
String toString() {
    return 'AuthEntity(status: $status, msg: $msg, token: $token, result: $result)';
}


}

/// @nodoc
abstract mixin class _$AuthEntityCopyWith<$Res> implements $AuthEntityCopyWith<$Res> {
  factory _$AuthEntityCopyWith(_AuthEntity value, $Res Function(_AuthEntity) _then) = __$AuthEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "msg") String? msg,@JsonKey(name: "token") String? token,@JsonKey(name: "result") Result? result
});


@override $ResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$AuthEntityCopyWithImpl<$Res>
    implements _$AuthEntityCopyWith<$Res> {
  __$AuthEntityCopyWithImpl(this._self, this._then);

  final _AuthEntity _self;
  final $Res Function(_AuthEntity) _then;

/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? msg = freezed,Object? token = freezed,Object? result = freezed,}) {
  return _then(_AuthEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}

/// Create a copy of AuthEntity
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

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "photo") String? get photo;@JsonKey(name: "role") String? get role;@JsonKey(name: "created_at") DateTime? get createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.photo, _this.photo) || other.photo == _this.photo)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Result;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.photo,_this.role,_this.createdAt);
}

@override
String toString() {
  final _this = this as Result;
  return 'Result(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, photo: ${_this.photo}, role: ${_this.role}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "phone") String? phone,@JsonKey(name: "photo") String? photo,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,Object? photo = freezed,Object? role = freezed,Object? createdAt = freezed,}) {
  return _then(Result(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.photo,_that.role,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.id,_that.name,_that.phone,_that.photo,_that.role,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "role")  String? role, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.photo,_that.role,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "phone") this.phone, @JsonKey(name: "photo") this.photo, @JsonKey(name: "role") this.role, @JsonKey(name: "created_at") this.createdAt});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "photo") final  String? photo;
@override@JsonKey(name: "role") final  String? role;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,photo,role,createdAt);
}

@override
String toString() {
    return 'Result(id: $id, name: $name, phone: $phone, photo: $photo, role: $role, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "phone") String? phone,@JsonKey(name: "photo") String? photo,@JsonKey(name: "role") String? role,@JsonKey(name: "created_at") DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,Object? photo = freezed,Object? role = freezed,Object? createdAt = freezed,}) {
  return _then(_Result(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
