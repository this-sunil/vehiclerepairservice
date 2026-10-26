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

  ShopState copyWith({
    ShopStatus? status,
    String? msg,
    List<Result>? model,
    bool? hasMore,
  }) {
    return ShopState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      model: model ?? this.model,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,model,hasMore];
}