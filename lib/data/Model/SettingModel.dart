// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) => SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  final bool? status;
  final String? msg;
  final Result? result;

  SettingModel({
    this.status,
    this.msg,
    this.result,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    status: json["status"],
    msg: json["msg"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": result?.toJson(),
  };
}

class Result {
  final int? sid;
  final String? contactUrl;
  final String? termsConditionUrl;
  final String? privacyPolicyUrl;
  final String? photo;
  final DateTime? createdAt;

  Result({
    this.sid,
    this.contactUrl,
    this.termsConditionUrl,
    this.privacyPolicyUrl,
    this.photo,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    sid: json["sid"],
    contactUrl: json["contact_url"],
    termsConditionUrl: json["terms_condition_url"],
    privacyPolicyUrl: json["privacy_policy_url"],
    photo: json["photo"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "sid": sid,
    "contact_url": contactUrl,
    "terms_condition_url": termsConditionUrl,
    "privacy_policy_url": privacyPolicyUrl,
    "photo": photo,
    "created_at": createdAt?.toIso8601String(),
  };
}
