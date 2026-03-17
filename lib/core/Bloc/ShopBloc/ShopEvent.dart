part of 'ShopBloc.dart';

abstract class ShopEvent extends Equatable{}

class SearchNearByCityEvent extends ShopEvent{
  final int page;
  final String city;
  SearchNearByCityEvent({required this.page,required this.city});
  @override
  // TODO: implement props
  List<Object?> get props => [page,city];
}