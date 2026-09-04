// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SlotEntity _$SlotEntityFromJson(Map<String, dynamic> json) => _SlotEntity(
  status: json['status'] as bool?,
  msg: json['msg'] as String?,
  totalPage: (json['totalPage'] as num?)?.toInt(),
  currentPage: (json['currentPage'] as num?)?.toInt(),
  prevPage: json['prevPage'] as bool?,
  nextPage: json['nextPage'] as bool?,
  result: (json['result'] as List<dynamic>?)
      ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SlotEntityToJson(_SlotEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'totalPage': instance.totalPage,
      'currentPage': instance.currentPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
      'result': instance.result,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  bookId: (json['book_id'] as num?)?.toInt(),
  uid: (json['uid'] as num?)?.toInt(),
  vehicleName: json['vehicle_name'] as String?,
  registrationNo: json['registration_no'] as String?,
  vehiclePhoto: json['vehicle_photo'] as String?,
  vehicleType: json['vehicle_type'] as String?,
  slotDate: json['slot_date'] as String?,
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
  'slot_date': instance.slotDate,
  'slot_time': instance.slotTime,
  'service_name': instance.serviceName,
  'created_at': instance.createdAt?.toIso8601String(),
};
