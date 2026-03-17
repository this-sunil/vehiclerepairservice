part of 'ServiceBloc.dart';
enum ServiceStatus{initial,loading,completed,error}
class ServiceState extends Equatable{
  final ServiceStatus? status;
  final String? msg;
  final bool? hasMore;
  final List<Result>? result;
  const ServiceState({this.status,this.msg,this.result,this.hasMore});

  factory ServiceState.initial(){
    return ServiceState(status: ServiceStatus.initial);
  }

  ServiceState copyWith({ServiceStatus? status,String? msg,List<Result>? result,bool? hasMore}){
    return ServiceState(status: status??status,msg: msg??msg,result: result??result,hasMore:hasMore??hasMore);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,result];

}