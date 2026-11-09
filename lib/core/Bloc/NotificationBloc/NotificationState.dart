part of 'NotificationBloc.dart';

class NotificationState extends Equatable {
  final NotificationStatus? status;
  final String? msg;
  final List<Result>? model;
  final bool hasMore;
  const NotificationState({
    this.status,
    this.msg,
    this.model,
    this.hasMore = false,
  });

  factory NotificationState.initial() =>
      NotificationState(status: NotificationStatus.initial);

  NotificationState copyWith({
    NotificationStatus? status,
    String? msg,
    List<Result>? model,
    bool? hasMore,
  }) {
    return NotificationState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      model: model ?? this.model,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [status, msg, model, hasMore];
}
