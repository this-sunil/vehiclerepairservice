// To parse this JSON data, do
//
//     final vehicleTypeModel = vehicleTypeModelFromJson(jsonString);

import 'dart:convert';

VehicleTypeModel vehicleTypeModelFromJson(String str) => VehicleTypeModel.fromJson(json.decode(str));

String vehicleTypeModelToJson(VehicleTypeModel data) => json.encode(data.toJson());

class VehicleTypeModel {
  final bool? status;
  final String? msg;
  final int? totalPage;
  final bool? prevPage;
  final bool? nextPage;
  final List<Result>? result;

  VehicleTypeModel({
    this.status,
    this.msg,
    this.totalPage,
    this.prevPage,
    this.nextPage,
    this.result,
  });

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) => VehicleTypeModel(
    status: json["status"],
    msg: json["msg"],
    totalPage: json["totalPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "totalPage": totalPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  final int? cid;
  final String? title;

  Result({
    this.cid,
    this.title,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    cid: json["cid"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "title": title,
  };
}
