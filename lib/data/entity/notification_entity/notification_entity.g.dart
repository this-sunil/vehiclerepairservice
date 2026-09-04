// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    _NotificationEntity(
      status: json['status'] as bool?,
      page: (json['page'] as num?)?.toInt(),
      totalPage: (json['totalPage'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      prevPage: json['prevPage'] as bool?,
      nextPage: json['nextPage'] as bool?,
    );

Map<String, dynamic> _$NotificationEntityToJson(_NotificationEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'page': instance.page,
      'totalPage': instance.totalPage,
      'msg': instance.msg,
      'result': instance.result,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
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
