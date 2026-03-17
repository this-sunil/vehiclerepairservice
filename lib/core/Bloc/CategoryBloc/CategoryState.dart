part of 'CategoryBloc.dart';
enum CatStatus {initial,loading,completed,error}
class CategoryState extends Equatable{
  final CatStatus? status;
  final String? msg;
  final List<Result>? result;
  const CategoryState({this.status,this.msg,this.result});
  factory CategoryState.initial(){
    return CategoryState(
      status: CatStatus.initial
    );
  }
  CategoryState copyWith({CatStatus? status,String? msg,List<Result>? result}){
    return CategoryState(
      status: status??status,
      msg: msg??msg,
      result: result??result
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,result];
}