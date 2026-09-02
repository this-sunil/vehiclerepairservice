// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  final bool? status;
  final String? msg;
  final Result? result;

  BookingModel({
    this.status,
    this.msg,
    this.result,
  });

  BookingModel copyWith({
    bool? status,
    String? msg,
    Result? result,
  }) =>
      BookingModel(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        result: result ?? this.result,
      );

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
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
  final int? bookId;
  final int? uid;
  final String? vehicleName;
  final String? registrationNo;
  final String? vehiclePhoto;
  final String? vehicleType;
  final DateTime? slotDate;
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

  Result copyWith({
    int? bookId,
    int? uid,
    String? vehicleName,
    String? registrationNo,
    String? vehiclePhoto,
    String? vehicleType,
    DateTime? slotDate,
    String? slotTime,
    String? serviceName,
    DateTime? createdAt,
  }) =>
      Result(
        bookId: bookId ?? this.bookId,
        uid: uid ?? this.uid,
        vehicleName: vehicleName ?? this.vehicleName,
        registrationNo: registrationNo ?? this.registrationNo,
        vehiclePhoto: vehiclePhoto ?? this.vehiclePhoto,
        vehicleType: vehicleType ?? this.vehicleType,
        slotDate: slotDate ?? this.slotDate,
        slotTime: slotTime ?? this.slotTime,
        serviceName: serviceName ?? this.serviceName,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    bookId: json["book_id"],
    uid: json["uid"],
    vehicleName: json["vehicle_name"],
    registrationNo: json["registration_no"],
    vehiclePhoto: json["vehicle_photo"],
    vehicleType: json["vehicle_type"],
    slotDate: json["slot_date"] == null ? null : DateTime.parse(json["slot_date"]),
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
    "slot_date": slotDate == null ? null : "${slotDate!.year.toString().padLeft(4, '0')}-${slotDate!.month.toString().padLeft(2, '0')}-${slotDate!.day.toString().padLeft(2, '0')}",
    "slot_time": slotTime,
    "service_name": serviceName,
    "created_at": createdAt?.toIso8601String(),
  };
}
