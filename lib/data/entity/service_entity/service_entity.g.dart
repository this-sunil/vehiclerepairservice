// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceEntity _$ServiceEntityFromJson(Map<String, dynamic> json) =>
    _ServiceEntity(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceEntityToJson(_ServiceEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  photo: json['photo'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'photo': instance.photo,
  'created_at': instance.createdAt?.toIso8601String(),
};
