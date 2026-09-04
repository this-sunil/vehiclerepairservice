import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_entity.freezed.dart';

part 'cat_entity.g.dart';

@freezed
abstract class CatEntity with _$CatEntity {
  const factory CatEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "totalPage") int? totalPage,
    @JsonKey(name: "prevPage") bool? prevPage,
    @JsonKey(name: "nextPage") bool? nextPage,
    @JsonKey(name: "result") List<Result>? result,
  }) = _CatEntity;

  factory CatEntity.fromJson(Map<String, dynamic> json) =>
      _$CatEntityFromJson(json);
}

@freezed
abstract class Result with _$Result {
  const factory Result({
    @JsonKey(name: "cid") int? cid,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "vehicle_type") String? vehicleType,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
