import '../../../data/Model/ServiceModel.dart';
import '../../../domain/Repository/ServiceRepository.dart';
import '../../../layer/Widget/Storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
part 'ServiceEvent.dart';
part 'ServiceState.dart';

class ServiceBloc extends Bloc<ServiceEvent,ServiceState>{
  final ServiceRepository repository;
  ServiceBloc(this.repository):super(ServiceState(status: ServiceStatus.initial)){
    on<FetchServiceEvent>(_fetchServiceApi);
    on<SearchEvent>(_fetchSearch);
  }

  Future _fetchServiceApi(FetchServiceEvent event,Emitter<ServiceState> emit) async{
    final List<Result> currentList = event.page == 1 ? [] : List.from(state.result ?? []);

    if(event.page==1){
      emit(state.copyWith(
          status: ServiceStatus.loading,
          result: [],
          msg: 'Loading pages !!!',
          hasMore: true));
    }

    String? token=await Storage.instance.getToken();
    final result=await repository.fetchService(url: '${dotenv.env["BASE_URL"]}${dotenv.env["FETCH_SERVICE"]}',header: {
      "accept":"application/json",
      "Authorization":"Bearer $token"
    },body:{
      'page':event.page.toString()
    });
    return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg,hasMore: false)), (r){
      final updateList=currentList..addAll(r.result);
      emit(state.copyWith(status: r.status,msg: r.msg,result: updateList,hasMore: true));
    });
  }

  Future _fetchSearch(SearchEvent event,Emitter<ServiceState> emit) async{
    final List<Result> currentList = event.page == 1 ? [] : List.from(state.result ?? []);

    if(event.page==1){
      emit(state.copyWith(
          status: ServiceStatus.loading,
          result: [],
          msg: 'Loading pages !!!',
          hasMore: true));
    }

    String? token=await Storage.instance.getToken();
    final result=await repository.searchService(url: '${dotenv.env["BASE_URL"]}${dotenv.env["SEARCH_SERVICE"]}',
        header: {
      "accept":"application/json",
      "Authorization":"Bearer $token"
    },
        body:{
      'search':event.searchText,
      'page':event.page.toString()
    });
    return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg,hasMore: false)), (r){
      final updateList=currentList..addAll(r.result);
      emit(state.copyWith(status: r.status,msg: r.msg,result: updateList,hasMore: true));
    });

  }
}