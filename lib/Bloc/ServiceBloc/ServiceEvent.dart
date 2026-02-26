part of 'ServiceBloc.dart';

abstract class ServiceEvent extends Equatable{}
class FetchServiceEvent extends ServiceEvent{
  final int page;
  FetchServiceEvent({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];
}
class SearchEvent extends ServiceEvent{
  final String searchText;
  final int page;
  SearchEvent({required this.searchText, required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [searchText,page];
}