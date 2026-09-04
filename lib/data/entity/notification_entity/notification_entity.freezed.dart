// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationEntity {

@JsonKey(name: "status") bool? get status;@JsonKey(name: "page") int? get page;@JsonKey(name: "totalPage") int? get totalPage;@JsonKey(name: "msg") String? get msg;@JsonKey(name: "result") List<Result>? get result;@JsonKey(name: "prevPage") bool? get prevPage;@JsonKey(name: "nextPage") bool? get nextPage;
/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationEntityCopyWith<NotificationEntity> get copyWith => _$NotificationEntityCopyWithImpl<NotificationEntity>(this as NotificationEntity, _$identity);

  /// Serializes this NotificationEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.totalPage, _this.totalPage) || other.totalPage == _this.totalPage)&&(identical(other.msg, _this.msg) || other.msg == _this.msg)&&const DeepCollectionEquality().equals(other.result, _this.result)&&(identical(other.prevPage, _this.prevPage) || other.prevPage == _this.prevPage)&&(identical(other.nextPage, _this.nextPage) || other.nextPage == _this.nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationEntity;
  return Object.hash(runtimeType,_this.status,_this.page,_this.totalPage,_this.msg,const DeepCollectionEquality().hash(_this.result),_this.prevPage,_this.nextPage);
}

@override
String toString() {
  final _this = this as NotificationEntity;
  return 'NotificationEntity(status: ${_this.status}, page: ${_this.page}, totalPage: ${_this.totalPage}, msg: ${_this.msg}, result: ${_this.result}, prevPage: ${_this.prevPage}, nextPage: ${_this.nextPage})';
}


}

/// @nodoc
abstract mixin class $NotificationEntityCopyWith<$Res>  {
  factory $NotificationEntityCopyWith(NotificationEntity value, $Res Function(NotificationEntity) _then) = _$NotificationEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "page") int? page,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") List<Result>? result,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage
});




}
/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._self, this._then);

  final NotificationEntity _self;
  final $Res Function(NotificationEntity) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? page = freezed,Object? totalPage = freezed,Object? msg = freezed,Object? result = freezed,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(NotificationEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationEntity].
extension NotificationEntityPatterns on NotificationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationEntity value)  $default,){
final _that = this;
switch (_that) {
case _NotificationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "page")  int? page, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
return $default(_that.status,_that.page,_that.totalPage,_that.msg,_that.result,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "page")  int? page, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage)  $default,) {final _that = this;
switch (_that) {
case _NotificationEntity():
return $default(_that.status,_that.page,_that.totalPage,_that.msg,_that.result,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "status")  bool? status, @JsonKey(name: "page")  int? page, @JsonKey(name: "totalPage")  int? totalPage, @JsonKey(name: "msg")  String? msg, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage")  bool? prevPage, @JsonKey(name: "nextPage")  bool? nextPage)?  $default,) {final _that = this;
switch (_that) {
case _NotificationEntity() when $default != null:
return $default(_that.status,_that.page,_that.totalPage,_that.msg,_that.result,_that.prevPage,_that.nextPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationEntity implements NotificationEntity {
  const _NotificationEntity({@JsonKey(name: "status") this.status, @JsonKey(name: "page") this.page, @JsonKey(name: "totalPage") this.totalPage, @JsonKey(name: "msg") this.msg, @JsonKey(name: "result")  List<Result>? result, @JsonKey(name: "prevPage") this.prevPage, @JsonKey(name: "nextPage") this.nextPage}): _result = result;
  factory _NotificationEntity.fromJson(Map<String, dynamic> json) => _$NotificationEntityFromJson(json);

@override@JsonKey(name: "status") final  bool? status;
@override@JsonKey(name: "page") final  int? page;
@override@JsonKey(name: "totalPage") final  int? totalPage;
@override@JsonKey(name: "msg") final  String? msg;
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

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationEntityCopyWith<_NotificationEntity> get copyWith => __$NotificationEntityCopyWithImpl<_NotificationEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPage, totalPage) || other.totalPage == totalPage)&&(identical(other.msg, msg) || other.msg == msg)&&const DeepCollectionEquality().equals(other.result, _result)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,page,totalPage,msg,const DeepCollectionEquality().hash(_result),prevPage,nextPage);
}

@override
String toString() {
    return 'NotificationEntity(status: $status, page: $page, totalPage: $totalPage, msg: $msg, result: $result, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class _$NotificationEntityCopyWith<$Res> implements $NotificationEntityCopyWith<$Res> {
  factory _$NotificationEntityCopyWith(_NotificationEntity value, $Res Function(_NotificationEntity) _then) = __$NotificationEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "status") bool? status,@JsonKey(name: "page") int? page,@JsonKey(name: "totalPage") int? totalPage,@JsonKey(name: "msg") String? msg,@JsonKey(name: "result") List<Result>? result,@JsonKey(name: "prevPage") bool? prevPage,@JsonKey(name: "nextPage") bool? nextPage
});




}
/// @nodoc
class __$NotificationEntityCopyWithImpl<$Res>
    implements _$NotificationEntityCopyWith<$Res> {
  __$NotificationEntityCopyWithImpl(this._self, this._then);

  final _NotificationEntity _self;
  final $Res Function(_NotificationEntity) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? page = freezed,Object? totalPage = freezed,Object? msg = freezed,Object? result = freezed,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_NotificationEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,totalPage: freezed == totalPage ? _self.totalPage : totalPage // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Result>?,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as bool?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Result {

@JsonKey(name: "id") int? get id;@JsonKey(name: "title") String? get title;@JsonKey(name: "description") String? get description;@JsonKey(name: "photo") String? get photo;@JsonKey(name: "created_at") DateTime? get createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.photo, _this.photo) || other.photo == _this.photo)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Result;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.photo,_this.createdAt);
}

@override
String toString() {
  final _this = this as Result;
  return 'Result(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, photo: ${_this.photo}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "title") String? title,@JsonKey(name: "description") String? description,@JsonKey(name: "photo") String? photo,@JsonKey(name: "created_at") DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? photo = freezed,Object? createdAt = freezed,}) {
  return _then(Result(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.photo,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "created_at")  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.id,_that.title,_that.description,_that.photo,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "photo")  String? photo, @JsonKey(name: "created_at")  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.photo,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({@JsonKey(name: "id") this.id, @JsonKey(name: "title") this.title, @JsonKey(name: "description") this.description, @JsonKey(name: "photo") this.photo, @JsonKey(name: "created_at") this.createdAt});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "description") final  String? description;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,photo,createdAt);
}

@override
String toString() {
    return 'Result(id: $id, title: $title, description: $description, photo: $photo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "title") String? title,@JsonKey(name: "description") String? description,@JsonKey(name: "photo") String? photo,@JsonKey(name: "created_at") DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? photo = freezed,Object? createdAt = freezed,}) {
  return _then(_Result(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
