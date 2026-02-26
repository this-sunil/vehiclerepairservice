// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  final bool? status;
  final String? msg;
  final List<Result>? result;

  ServiceModel({
    this.status,
    this.msg,
    this.result,
  });

  ServiceModel copyWith({
    bool? status,
    String? msg,
    List<Result>? result,
  }) =>
      ServiceModel(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        result: result ?? this.result,
      );

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
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

  Result copyWith({
    int? id,
    String? title,
    String? description,
    String? photo,
    DateTime? createdAt,
  }) =>
      Result(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        photo: photo ?? this.photo,
        createdAt: createdAt ?? this.createdAt,
      );

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
