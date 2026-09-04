// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthEntity _$AuthEntityFromJson(Map<String, dynamic> json) => _AuthEntity(
  status: json['status'] as bool?,
  msg: json['msg'] as String?,
  token: json['token'] as String?,
  result: json['result'] == null
      ? null
      : Result.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthEntityToJson(_AuthEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'token': instance.token,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  role: json['role'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'photo': instance.photo,
  'role': instance.role,
  'created_at': instance.createdAt?.toIso8601String(),
};
