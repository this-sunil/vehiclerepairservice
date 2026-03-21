import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../data/Model/SubscriptionModel.dart';
import '../../../domain/Repository/SubscriptionRepo.dart';
import '../../../layer/Widget/Storage.dart';
part 'SubscriptionEvent.dart';
part 'SubscriptionState.dart';
class SubscriptionBloc extends Bloc<SubscriptionEvent,SubscriptionState>{
  final SubscriptionRepo repo;
  SubscriptionBloc(this.repo):super(SubscriptionState.initial()){
    on<FetchSubscriptionEvent>(_fetchSubscription);
  }
  Future<void> _fetchSubscription(FetchSubscriptionEvent event,Emitter<SubscriptionState> emit) async{
      emit(state.copyWith(status: SubscriptionStatus.loading));
      String? token=await Storage.instance.getToken();

      Map<String,String> header={
        "Authorization":"Bearer $token",
        "Accept":"application/json"
      };
      final result=await repo.fetchSubscription(url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_PLAN']}',header: header);
      return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg)), (r)=>emit(state.copyWith(status: r.status,msg: r.msg,model: r.result)));
  }
}