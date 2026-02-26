part of 'NotificationBloc.dart';
abstract class NotificationEvent extends Equatable{}
class FetchNotificationEvent extends NotificationEvent{
  final int page;
  FetchNotificationEvent({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];
}