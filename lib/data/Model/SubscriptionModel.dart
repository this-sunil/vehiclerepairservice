// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) => SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) => json.encode(data.toJson());

class SubscriptionModel {
  final bool? status;
  final String? msg;
  final List<Result>? result;

  SubscriptionModel({
    this.status,
    this.msg,
    this.result,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
    status: json["status"],
    msg: json["msg"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  final int? pid;
  final String? planTitle;
  final String? planType;
  final int? planPrice;
  final DateTime? createdAt;

  Result({
    this.pid,
    this.planTitle,
    this.planType,
    this.planPrice,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    pid: json["pid"],
    planTitle: json["plan_title"],
    planType: json["plan_type"],
    planPrice: json["plan_price"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "pid": pid,
    "plan_title": planTitle,
    "plan_type": planType,
    "plan_price": planPrice,
    "created_at": createdAt?.toIso8601String(),
  };
}
