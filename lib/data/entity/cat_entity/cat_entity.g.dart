// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatEntity _$CatEntityFromJson(Map<String, dynamic> json) => _CatEntity(
  status: json['status'] as bool?,
  msg: json['msg'] as String?,
  page: (json['page'] as num?)?.toInt(),
  totalPage: (json['totalPage'] as num?)?.toInt(),
  prevPage: json['prevPage'] as bool?,
  nextPage: json['nextPage'] as bool?,
  result: (json['result'] as List<dynamic>?)
      ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CatEntityToJson(_CatEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'page': instance.page,
      'totalPage': instance.totalPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  cid: (json['cid'] as num?)?.toInt(),
  title: json['title'] as String?,
  photo: json['photo'] as String?,
  vehicleType: json['vehicle_type'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'cid': instance.cid,
  'title': instance.title,
  'photo': instance.photo,
  'vehicle_type': instance.vehicleType,
  'created_at': instance.createdAt?.toIso8601String(),
};
