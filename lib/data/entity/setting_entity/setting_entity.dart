import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_entity.freezed.dart';

part 'setting_entity.g.dart';

@freezed
abstract class SettingEntity with _$SettingEntity {
  const factory SettingEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "result") Result? result,
  }) = _SettingEntity;

  factory SettingEntity.fromJson(Map<String, dynamic> json) =>
      _$SettingEntityFromJson(json);
}

@freezed
abstract class Result with _$Result {
  const factory Result({
    @JsonKey(name: "sid") int? sid,
    @JsonKey(name: "contact_url") String? contactUrl,
    @JsonKey(name: "terms_condition_url") String? termsConditionUrl,
    @JsonKey(name: "privacy_policy_url") String? privacyPolicyUrl,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
