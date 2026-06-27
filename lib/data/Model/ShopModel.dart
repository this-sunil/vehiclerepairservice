// To parse this JSON data, do
//
//     final shopModel = shopModelFromJson(jsonString);

import 'dart:convert';

ShopModel shopModelFromJson(String str) => ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel data) => json.encode(data.toJson());

class ShopModel {
  final bool? status;
  final String? msg;
  final int? currentPage;
  final int? totalPage;
  final List<Result>? result;
  final bool? prevPage;
  final bool? nextPage;

  ShopModel({
    this.status,
    this.msg,
    this.currentPage,
    this.totalPage,
    this.result,
    this.prevPage,
    this.nextPage,
  });

  ShopModel copyWith({
    bool? status,
    String? msg,
    int? currentPage,
    int? totalPage,
    List<Result>? result,
    bool? prevPage,
    bool? nextPage,
  }) =>
      ShopModel(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        currentPage: currentPage ?? this.currentPage,
        totalPage: totalPage ?? this.totalPage,
        result: result ?? this.result,
        prevPage: prevPage ?? this.prevPage,
        nextPage: nextPage ?? this.nextPage,
      );

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
    status: json["status"],
    msg: json["msg"],
    currentPage: json["currentPage"],
    totalPage: json["totalPage"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "currentPage": currentPage,
    "totalPage": totalPage,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class Result {
  final int? sid;
  final String? shopname;
  final String? shopphoto;
  final String? shoptime;
  final String? phone;
  final double? lat;
  final double? long;
  final bool? status;
  final String? city;
  final DateTime? createdAt;

  Result({
    this.sid,
    this.shopname,
    this.shopphoto,
    this.shoptime,
    this.phone,
    this.lat,
    this.long,
    this.status,
    this.city,
    this.createdAt,
  });

  Result copyWith({
    int? sid,
    String? shopname,
    String? shopphoto,
    String? shoptime,
    String? phone,
    double? lat,
    double? long,
    bool? status,
    String? city,
    DateTime? createdAt,
  }) =>
      Result(
        sid: sid ?? this.sid,
        shopname: shopname ?? this.shopname,
        shopphoto: shopphoto ?? this.shopphoto,
        shoptime: shoptime ?? this.shoptime,
        phone: phone ?? this.phone,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        status: status ?? this.status,
        city: city ?? this.city,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    sid: json["sid"],
    shopname: json["shopname"],
    shopphoto: json["shopphoto"],
    shoptime: json["shoptime"],
    phone: json["phone"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    status: json["status"],
    city: json["city"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "sid": sid,
    "shopname": shopname,
    "shopphoto": shopphoto,
    "shoptime": shoptime,
    "phone": phone,
    "lat": lat,
    "long": long,
    "status": status,
    "city": city,
    "created_at": createdAt?.toIso8601String(),
  };
}
