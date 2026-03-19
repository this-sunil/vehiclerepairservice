part of 'ForgotPassBloc.dart';

enum ForgotStatus{initial,loading,send,verify,set,error}

class ForgotPassState extends Equatable{
  final ForgotStatus? status;
  final String? msg;
  final dynamic result;
  const ForgotPassState({this.status,this.msg,this.result});

  factory ForgotPassState.initial()=>ForgotPassState(status: ForgotStatus.initial);

  ForgotPassState copyWith({ForgotStatus? status,String? msg,dynamic result}){
    return ForgotPassState(
      status: status??status,
      msg: msg??msg,
      result: result??result
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,result];
}