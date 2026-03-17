part of 'SettingBloc.dart';
enum SettingStatus {initial,loading,completed,error}

class SettingState extends Equatable{
  final SettingStatus? status;
  final String? msg;
  final SettingModel? result;
  const SettingState({this.status,this.msg,this.result});

  factory SettingState.initial()=>SettingState(status: SettingStatus.initial);
  SettingState copyWith({SettingStatus? status,String? msg,SettingModel? result}){
    return SettingState(status:status??status,msg: msg??msg,result: result??result);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,result];
}