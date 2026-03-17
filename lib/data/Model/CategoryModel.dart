// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final bool? status;
  final String? msg;
  final int? page;
  final int? totalPage;
  final bool? prevPage;
  final bool? nextPage;
  final List<Result>? result;

  CategoryModel({
    this.status,
    this.msg,
    this.page,
    this.totalPage,
    this.prevPage,
    this.nextPage,
    this.result,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    msg: json["msg"],
    page: json["page"],
    totalPage: json["totalPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "page": page,
    "totalPage": totalPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  final int? cid;
  final String? title;
  final String? photo;
  final String? vehicleType;
  final DateTime? createdAt;

  Result({
    this.cid,
    this.title,
    this.photo,
    this.vehicleType,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    cid: json["cid"],
    title: json["title"],
    photo: json["photo"],
    vehicleType: json["vehicle_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "title": title,
    "photo": photo,
    "vehicle_type": vehicleType,
    "created_at": createdAt?.toIso8601String(),
  };
}
