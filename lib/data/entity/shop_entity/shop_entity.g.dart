// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopEntity _$ShopEntityFromJson(Map<String, dynamic> json) => _ShopEntity(
  status: json['status'] as bool?,
  msg: json['msg'] as String?,
  currentPage: (json['currentPage'] as num?)?.toInt(),
  totalPage: (json['totalPage'] as num?)?.toInt(),
  result: (json['result'] as List<dynamic>?)
      ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
      .toList(),
  prevPage: json['prevPage'] as bool?,
  nextPage: json['nextPage'] as bool?,
);

Map<String, dynamic> _$ShopEntityToJson(_ShopEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'result': instance.result,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  sid: (json['sid'] as num?)?.toInt(),
  shopname: json['shopname'] as String?,
  shopphoto: json['shopphoto'] as String?,
  shoptime: json['shoptime'] as String?,
  phone: json['phone'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  long: (json['long'] as num?)?.toDouble(),
  status: json['status'] as bool?,
  city: json['city'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'sid': instance.sid,
  'shopname': instance.shopname,
  'shopphoto': instance.shopphoto,
  'shoptime': instance.shoptime,
  'phone': instance.phone,
  'lat': instance.lat,
  'long': instance.long,
  'status': instance.status,
  'city': instance.city,
  'created_at': instance.createdAt?.toIso8601String(),
};
