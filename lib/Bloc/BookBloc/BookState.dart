part of 'BookBloc.dart';

enum BookStatus{initial,loading,completed,error}

class BookState extends Equatable{
  final BookStatus? status;
  final String? msg;
  final List<Result>? model;
  final bool? hasMore;
  const BookState({this.status,this.msg, this.model,this.hasMore});

  factory BookState.initial(){
    return BookState(
      status: BookStatus.initial
    );
  }

  BookState copyWith({BookStatus? status,String? msg,List<Result>? model,bool? hasMore}){
    return BookState(status: status??status,msg: msg??msg,model: model??model,hasMore: hasMore??hasMore);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,model];

}