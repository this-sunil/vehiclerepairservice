import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot_entity.freezed.dart';

part 'slot_entity.g.dart';

@freezed
abstract class SlotEntity with _$SlotEntity {
  const factory SlotEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "totalPage") int? totalPage,
    @JsonKey(name: "currentPage") int? currentPage,
    @JsonKey(name: "prevPage") bool? prevPage,
    @JsonKey(name: "nextPage") bool? nextPage,
    @JsonKey(name: "result") List<Result>? result,
  }) = _SlotEntity;

  factory SlotEntity.fromJson(Map<String, dynamic> json) =>
      _$SlotEntityFromJson(json);
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
    @JsonKey(name: "slot_date") String? slotDate,
    @JsonKey(name: "slot_time") String? slotTime,
    @JsonKey(name: "service_name") String? serviceName,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
