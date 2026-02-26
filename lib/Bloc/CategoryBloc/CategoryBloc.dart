import 'package:vehicle_repair_service/Model/CategoryModel.dart';
import 'package:vehicle_repair_service/Repository/CategoryRepository.dart';
import 'package:vehicle_repair_service/Widget/Storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
part 'CategoryEvent.dart';
part 'CategoryState.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  final CategoryRepository repository;
  CategoryBloc(this.repository):super(CategoryState.initial()){
    on<FetchCatEvent>(_fetchCategoryApi);
  }

  Future<void> _fetchCategoryApi(FetchCatEvent event,Emitter<CategoryState> emit) async{
      emit(state.copyWith(status: CatStatus.loading));
      String? token=await Storage.instance.getToken();
      final result=await repository.fetchCat(url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_CAT_API']}',header: {
        "Content-Type":"application/json",
        "Authorization":"Bearer $token"
      });
      return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg)), (r)=>emit(state.copyWith(status: r.status,msg: r.msg,result: r.result)));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}