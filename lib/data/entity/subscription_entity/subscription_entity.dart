import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_entity.freezed.dart';

part 'subscription_entity.g.dart';

@freezed
abstract class SubscriptionEntity with _$SubscriptionEntity {
  const factory SubscriptionEntity({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "msg") String? msg,
    @JsonKey(name: "result") List<Result>? result,
  }) = _SubscriptionEntity;

  factory SubscriptionEntity.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionEntityFromJson(json);
}

@freezed
abstract class Result with _$Result {
  const factory Result({
    @JsonKey(name: "pid") int? pid,
    @JsonKey(name: "plan_title") String? planTitle,
    @JsonKey(name: "plan_type") String? planType,
    @JsonKey(name: "plan_price") int? planPrice,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
