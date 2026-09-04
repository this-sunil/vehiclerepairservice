import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'service_entity.freezed.dart';

part 'service_entity.g.dart';

@freezed
abstract class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "result") List<Result>? result,
  }) = _ServiceEntity;

  factory ServiceEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceEntityFromJson(json);
}

@freezed
abstract class Result with _$Result {
  const factory Result({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
