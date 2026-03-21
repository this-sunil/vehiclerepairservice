// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  final bool? status;
  final int? page;
  final int? totalPage;
  final String? msg;
  final List<Result>? result;
  final bool? prevPage;
  final bool? nextPage;

  NotificationModel({
    this.status,
    this.page,
    this.totalPage,
    this.msg,
    this.result,
    this.prevPage,
    this.nextPage,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"],
    page: json["page"],
    totalPage: json["totalPage"],
    msg: json["msg"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "page": page,
    "totalPage": totalPage,
    "msg": msg,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class Result {
  final int? id;
  final String? title;
  final String? description;
  final String? photo;
  final DateTime? createdAt;

  Result({
    this.id,
    this.title,
    this.description,
    this.photo,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    photo: json["photo"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "photo": photo,
    "created_at": createdAt?.toIso8601String(),
  };
}
