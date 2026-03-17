// To parse this JSON data, do
//
//     final slotHistoryModel = slotHistoryModelFromJson(jsonString);

import 'dart:convert';

SlotHistoryModel slotHistoryModelFromJson(String str) => SlotHistoryModel.fromJson(json.decode(str));

String slotHistoryModelToJson(SlotHistoryModel data) => json.encode(data.toJson());

class SlotHistoryModel {
  final bool? status;
  final String? msg;
  final int? totalPage;
  final int? currentPage;
  final bool? prevPage;
  final bool? nextPage;
  final List<Result>? result;

  SlotHistoryModel({
    this.status,
    this.msg,
    this.totalPage,
    this.currentPage,
    this.prevPage,
    this.nextPage,
    this.result,
  });

  factory SlotHistoryModel.fromJson(Map<String, dynamic> json) => SlotHistoryModel(
    status: json["status"],
    msg: json["msg"],
    totalPage: json["totalPage"],
    currentPage: json["currentPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "totalPage": totalPage,
    "currentPage": currentPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  final int? bookId;
  final int? uid;
  final String? vehicleName;
  final String? registrationNo;
  final String? vehiclePhoto;
  final String? vehicleType;
  final String? slotDate;
  final String? slotTime;
  final String? serviceName;
  final DateTime? createdAt;

  Result({
    this.bookId,
    this.uid,
    this.vehicleName,
    this.registrationNo,
    this.vehiclePhoto,
    this.vehicleType,
    this.slotDate,
    this.slotTime,
    this.serviceName,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    bookId: json["book_id"],
    uid: json["uid"],
    vehicleName: json["vehicle_name"],
    registrationNo: json["registration_no"],
    vehiclePhoto: json["vehicle_photo"],
    vehicleType: json["vehicle_type"],
    slotDate: json["slot_date"],
    slotTime: json["slot_time"],
    serviceName: json["service_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "book_id": bookId,
    "uid": uid,
    "vehicle_name": vehicleName,
    "registration_no": registrationNo,
    "vehicle_photo": vehiclePhoto,
    "vehicle_type": vehicleType,
    "slot_date": slotDate,
    "slot_time": slotTime,
    "service_name": serviceName,
    "created_at": createdAt?.toIso8601String(),
  };
}
