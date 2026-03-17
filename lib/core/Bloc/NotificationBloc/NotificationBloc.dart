import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../data/Model/NotificationModel.dart';
import '../../../domain/Repository/NotificationRepo.dart';
import '../../../layer/Widget/Storage.dart';

part 'NotificationEvent.dart';
part 'NotificationState.dart';
class NotificationBloc extends Bloc<NotificationEvent,NotificationState>{
  final NotificationRepository repository;
  NotificationBloc(this.repository):super(NotificationState.initial()){
    on<FetchNotificationEvent>(_fetchNotification);
  }

  Future<void> _fetchNotification(FetchNotificationEvent event,Emitter<NotificationState> emit) async{
    emit(state.copyWith(status: NotificationStatus.loading));
    String? uid=await Storage.instance.getToken();
    Map<String,dynamic> body={
      "uid":uid,
      "page":event.page.toString()
    };
    String? token=await Storage.instance.getToken();
    Map<String,String> header={
      "Authorization":"Bearer $token",
      "accept":"application/json",
    };
    final result=await repository.fetchNotification(url: '${dotenv.env['BASE_URL']}${dotenv.env['FETCH_NOTIFICATION']}',body: body,header: header);
    return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg)), (r)=>emit(state.copyWith(status: r.status,msg: r.msg,model: r.result)));
  }

}