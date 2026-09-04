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
      status: status ?? status,
      msg: msg ?? msg,
      model: model ?? model,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, msg, model];
}
