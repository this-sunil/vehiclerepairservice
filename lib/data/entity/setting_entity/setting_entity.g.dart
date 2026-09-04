// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingEntity _$SettingEntityFromJson(Map<String, dynamic> json) =>
    _SettingEntity(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingEntityToJson(_SettingEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  sid: (json['sid'] as num?)?.toInt(),
  contactUrl: json['contact_url'] as String?,
  termsConditionUrl: json['terms_condition_url'] as String?,
  privacyPolicyUrl: json['privacy_policy_url'] as String?,
  photo: json['photo'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'sid': instance.sid,
  'contact_url': instance.contactUrl,
  'terms_condition_url': instance.termsConditionUrl,
  'privacy_policy_url': instance.privacyPolicyUrl,
  'photo': instance.photo,
  'created_at': instance.createdAt?.toIso8601String(),
};
