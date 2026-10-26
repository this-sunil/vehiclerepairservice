part of 'LocationBloc.dart';
enum LocationStatus{initial,loading,completed,error}
class LocationState extends Equatable{
  final String? msg;
  final LocationStatus? status;
  final LocationModel? model;
  const LocationState({this.status,this.msg,this.model});
  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,model];

  factory LocationState.initial()=>LocationState(status: LocationStatus.initial);

  LocationState copyWith({
    LocationStatus? status,
    String? msg,
    LocationModel? model,
  }) {
    return LocationState(
      status: status ?? this.status,
      model: model ?? this.model,
      msg: msg ?? this.msg,
    );
  }
}
