// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookEntity _$BookEntityFromJson(Map<String, dynamic> json) => _BookEntity(
  status: json['status'] as bool?,
  msg: json['msg'] as String?,
  result: json['result'] == null
      ? null
      : Result.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookEntityToJson(_BookEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  bookId: (json['book_id'] as num?)?.toInt(),
  uid: (json['uid'] as num?)?.toInt(),
  vehicleName: json['vehicle_name'] as String?,
  registrationNo: json['registration_no'] as String?,
  vehiclePhoto: json['vehicle_photo'] as String?,
  vehicleType: json['vehicle_type'] as String?,
  slotDate: json['slot_date'] == null
      ? null
      : DateTime.parse(json['slot_date'] as String),
  slotTime: json['slot_time'] as String?,
  serviceName: json['service_name'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'book_id': instance.bookId,
  'uid': instance.uid,
  'vehicle_name': instance.vehicleName,
  'registration_no': instance.registrationNo,
  'vehicle_photo': instance.vehiclePhoto,
  'vehicle_type': instance.vehicleType,
  'slot_date': instance.slotDate?.toIso8601String(),
  'slot_time': instance.slotTime,
  'service_name': instance.serviceName,
  'created_at': instance.createdAt?.toIso8601String(),
};
