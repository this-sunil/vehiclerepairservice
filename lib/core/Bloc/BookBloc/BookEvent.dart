part of 'BookBloc.dart';
abstract class BookEvent extends Equatable{}

class BookAppointEvent extends BookEvent{
  final String vehicleName;
  final String registerNo;
  final XFile photo;
  final String vehicleType;
  final String slotDate;
  final String slotTime;
  final String serviceName;
  BookAppointEvent({required this.vehicleName,required this.registerNo,required this.vehicleType,required this.slotDate,required this.slotTime, required this.serviceName, required this.photo});

  @override
  // TODO: implement props
  List<Object?> get props => [vehicleName,registerNo,vehicleType,slotDate,slotTime,serviceName,photo];

}
class FetchSlotHistoryEvent extends BookEvent{
  final int page;
  FetchSlotHistoryEvent({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];
}