import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'auth_entity.freezed.dart';

part 'auth_entity.g.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "result") Result? result,
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);
}

@freezed
abstract class Result with _$Result {
  const factory Result({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
