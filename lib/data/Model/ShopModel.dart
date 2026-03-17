// To parse this JSON data, do
//
//     final shopModel = shopModelFromJson(jsonString);

import 'dart:convert';

ShopModel shopModelFromJson(String str) => ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel data) => json.encode(data.toJson());

class ShopModel {
  final bool? status;
  final int? page;
  final int? totalPage;
  final String? msg;
  final List<Result>? result;
  final bool? prevPage;
  final bool? nextPage;

  ShopModel({
    this.status,
    this.page,
    this.totalPage,
    this.msg,
    this.result,
    this.prevPage,
    this.nextPage,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
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
  final int? sid;
  final String? shopName;
  final String? shopPhoto;
  final String? shopTime;
  final String? phone;
  final double? lat;
  final double? long;
  final bool? status;
  final String? city;
  final DateTime? createdAt;

  Result({
    this.sid,
    this.shopName,
    this.shopPhoto,
    this.shopTime,
    this.phone,
    this.lat,
    this.long,
    this.status,
    this.city,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    sid: json["sid"],
    shopName: json["shop_name"],
    shopPhoto: json["shop_photo"],
    shopTime: json["shop_time"],
    phone: json["phone"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    status: json["status"],
    city: json["city"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "sid": sid,
    "shop_name": shopName,
    "shop_photo": shopPhoto,
    "shop_time": shopTime,
    "phone": phone,
    "lat": lat,
    "long": long,
    "status": status,
    "city": city,
    "created_at": createdAt?.toIso8601String(),
  };
}
