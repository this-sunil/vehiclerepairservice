// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionEntity _$SubscriptionEntityFromJson(Map<String, dynamic> json) =>
    _SubscriptionEntity(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionEntityToJson(_SubscriptionEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  pid: (json['pid'] as num?)?.toInt(),
  planTitle: json['plan_title'] as String?,
  planType: json['plan_type'] as String?,
  planPrice: (json['plan_price'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'pid': instance.pid,
  'plan_title': instance.planTitle,
  'plan_type': instance.planType,
  'plan_price': instance.planPrice,
  'created_at': instance.createdAt?.toIso8601String(),
};
