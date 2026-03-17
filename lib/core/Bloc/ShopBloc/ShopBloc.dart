import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../data//Model/ShopModel.dart';
import '../../../domain/Repository/SearchShopRepository.dart';
import '../../../layer/Widget/Storage.dart';
part 'ShopEvent.dart';
part 'ShopState.dart';

class ShopBloc extends Bloc<ShopEvent,ShopState>{
  final SearchShopRepo repo;
  ShopBloc(this.repo):super(ShopState.initial()){
    on<SearchNearByCityEvent>(_searchByCity);
  }
  Future<void> _searchByCity(SearchNearByCityEvent event,Emitter<ShopState> emit) async{
    final List<Result> currentList = event.page == 1 ? [] : List.from(state.model ?? []);

    if(event.page==1){
      emit(state.copyWith(status: ShopStatus.loading,model: [],hasMore: true));
    }
    String? token=await Storage.instance.getToken();

    Map<String,dynamic> body={
      "page":event.page.toString(),
      "city":event.city
    };
    Map<String,String> header={
      "Authorization":"Bearer $token"
    };
    final result=await repo.searchByCity(url: '${dotenv.env["BASE_URL"]}${dotenv.env['SEARCH_BY_CITY']}', body: body,header: header);
    return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg,hasMore: false)), (r){
      final updateList=currentList..addAll(r.result);
      emit(state.copyWith(status: r.status,msg: r.msg,model: updateList,hasMore:  r.result.length == 10));
    });
  }
}