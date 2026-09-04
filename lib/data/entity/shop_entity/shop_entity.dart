import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_entity.freezed.dart';

part 'shop_entity.g.dart';

@freezed
abstract class ShopEntity with _$ShopEntity {
  const factory ShopEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "currentPage") int? currentPage,
    @JsonKey(name: "totalPage") int? totalPage,
    @JsonKey(name: "result") List<Result>? result,
    @JsonKey(name: "prevPage") bool? prevPage,
    @JsonKey(name: "nextPage") bool? nextPage,
  }) = _ShopEntity;

  factory ShopEntity.fromJson(Map<String, dynamic> json) =>
      _$ShopEntityFromJson(json);
}

@freezed
abstract class Result with _$Result {
  const factory Result({
    @JsonKey(name: "sid") int? sid,
    @JsonKey(name: "shopname") String? shopname,
    @JsonKey(name: "shopphoto") String? shopphoto,
    @JsonKey(name: "shoptime") String? shoptime,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "lat") double? lat,
    @JsonKey(name: "long") double? long,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
