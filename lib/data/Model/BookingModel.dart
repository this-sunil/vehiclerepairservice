import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  final bool? status;
  final String? msg;
  final Result? result;

  BookingModel({this.status, this.msg, this.result});

  BookingModel copyWith({bool? status, String? msg, Result? result}) {
    return BookingModel(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      result: result ?? this.result,
    );
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      status: json["status"] as bool?,
      msg: json["msg"]?.toString(),
      result: json["result"] == null
          ? null
          : Result.fromJson(json["result"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {"status": status, "msg": msg, "result": result?.toJson()};
  }
}

class Result {
  final int? bookId;
  final int? uid;
  final String? vehicleName;
  final String? registrationNo;
  final String? vehiclePhoto;
  final String? vehicleType;

  // PostgreSQL DATE
  final String? slotDate;

  // PostgreSQL TIME
  final String? slotTime;

  final String? serviceName;

  // PostgreSQL TIMESTAMP
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
    String? slotDate,
    String? slotTime,
    String? serviceName,
    DateTime? createdAt,
  }) {
    return Result(
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
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      bookId: json["book_id"] is int
          ? json["book_id"]
          : int.tryParse(json["book_id"]?.toString() ?? ""),

      uid: json["uid"] is int
          ? json["uid"]
          : int.tryParse(json["uid"]?.toString() ?? ""),

      vehicleName: json["vehicle_name"]?.toString(),

      registrationNo: json["registration_no"]?.toString(),

      vehiclePhoto: json["vehicle_photo"]?.toString(),

      vehicleType: json["vehicle_type"]?.toString(),

      // Keep PostgreSQL DATE as String
      slotDate: json["slot_date"]?.toString(),

      // Keep PostgreSQL TIME as String
      slotTime: json["slot_time"]?.toString(),

      serviceName: json["service_name"]?.toString(),

      // Safely parse timestamp
      createdAt: json["created_at"] == null
          ? null
          : DateTime.tryParse(json["created_at"].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
}
