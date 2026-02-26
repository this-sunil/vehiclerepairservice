part of 'PhoneAuthBloc.dart';
enum PhoneAuthStatus{initial,loading,send,verify,error}

class PhoneAuthState extends Equatable{
  final PhoneAuthStatus? status;
  final String? msg;
  final String? model;
  const PhoneAuthState({this.status,this.msg,this.model});

  factory PhoneAuthState.initial(){
    return PhoneAuthState(status: PhoneAuthStatus.initial);
  }

  PhoneAuthState copyWith({PhoneAuthStatus? status,String? msg,String? model}){
    return PhoneAuthState(status: status??status,msg: msg??msg,model: model??model);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,model];
}
