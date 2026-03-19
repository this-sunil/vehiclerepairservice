part of 'ShopBloc.dart';
enum ShopStatus {initial,loading,completed,error}
class ShopState extends Equatable{
  final ShopStatus? status;
  final String? msg;
  final List<Result>? model;
  final bool hasMore;
  const ShopState({this.status,this.msg,this.model,required this.hasMore});

  factory ShopState.initial(){
    return ShopState(status: ShopStatus.initial,hasMore: false);
  }

  ShopState copyWith({ShopStatus? status,String? msg,List<Result>? model,required bool hasMore}){
    return ShopState(status: status??status,msg: msg??msg,model: model??model,hasMore: hasMore);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,model,hasMore];
}