part of 'SubscriptionBloc.dart';

enum SubscriptionStatus { initial, loading, completed, error }

class SubscriptionState extends Equatable {
  final SubscriptionStatus? status;
  final String? msg;
  final SubscriptionEntity? model;

  const SubscriptionState({this.status, this.msg, this.model});

  factory SubscriptionState.initial() =>
      SubscriptionState(status: SubscriptionStatus.initial);

  SubscriptionState copyWith({
    SubscriptionStatus? status,
    String? msg,
    SubscriptionEntity? model,
  }) {
    return SubscriptionState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      model: model ?? this.model,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, msg, model];
}
