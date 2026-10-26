part of 'NotificationBloc.dart';
enum NotificationStatus {initial,loading,completed,error}

class NotificationState extends Equatable{
  final NotificationStatus? status;
  final String? msg;
  final List<Result>? model;
  const NotificationState({this.status,this.msg,this.model});

  factory NotificationState.initial()=>NotificationState(status: NotificationStatus.initial);

  NotificationState copyWith({
    NotificationStatus? status,
    String? msg,
    List<Result>? model,
  }) {
    return NotificationState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      model: model ?? this.model,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg,model];
}