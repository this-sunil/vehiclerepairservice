import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

part 'notification_entity.g.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "totalPage") int? totalPage,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "result") List<Result>? result,
    @JsonKey(name: "prevPage") bool? prevPage,
    @JsonKey(name: "nextPage") bool? nextPage,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
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
