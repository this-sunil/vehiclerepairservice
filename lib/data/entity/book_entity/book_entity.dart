import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_entity.freezed.dart';

part 'book_entity.g.dart';

@freezed
abstract class BookEntity with _$BookEntity {
  const factory BookEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "result") Result? result,
  }) = _BookEntity;

  factory BookEntity.fromJson(Map<String, dynamic> json) =>
      _$BookEntityFromJson(json);
}

@freezed
abstract class Result with _$Result {
  const factory Result({
    @JsonKey(name: "book_id") int? bookId,
    @JsonKey(name: "uid") int? uid,
    @JsonKey(name: "vehicle_name") String? vehicleName,
    @JsonKey(name: "registration_no") String? registrationNo,
    @JsonKey(name: "vehicle_photo") String? vehiclePhoto,
    @JsonKey(name: "vehicle_type") String? vehicleType,
    @JsonKey(name: "slot_date") DateTime? slotDate,
    @JsonKey(name: "slot_time") String? slotTime,
    @JsonKey(name: "service_name") String? serviceName,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
