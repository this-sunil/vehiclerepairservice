import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_repair_service/Model/SubscriptionModel.dart';
import 'package:vehicle_repair_service/Repository/SubscriptionRepo.dart';
import 'package:vehicle_repair_service/Widget/Storage.dart';
part 'SubscriptionEvent.dart';
part 'SubscriptionState.dart';
class SubscriptionBloc extends Bloc<SubscriptionEvent,SubscriptionState>{
  final SubscriptionRepo repo;
  SubscriptionBloc(this.repo):super(SubscriptionState.initial()){
    on<FetchSubscriptionEvent>(_fetchSubscription);
  }
  Future<void> _fetchSubscription(FetchSubscriptionEvent event,Emitter<SubscriptionState> emit) async{
      emit(state.copyWith(status: SubscriptionStatus.loading));
      String? uid=await Storage.instance.getUID();
      String? token=await Storage.instance.getToken();
      Map<String,dynamic> body={
        "uid":uid,
      };
      Map<String,String> header={
        "Authorization":"Bearer $token"
      };
      final result=await repo.fetchSubscription(url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_PLAN']}',body: body,header: header);
      return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg)), (r)=>emit(state.copyWith(status: r.status,msg: r.msg,model: r.result)));
  }
}