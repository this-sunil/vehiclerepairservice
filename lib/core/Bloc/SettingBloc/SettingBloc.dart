import '../../../data/Model/SettingModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../domain/Repository/SettingRepository.dart';
import '../../../layer/Widget/Storage.dart';
part 'SettingEvent.dart';
part 'SettingState.dart';

class SettingBloc extends Bloc<SettingEvent,SettingState>{
  final SettingRepository repository;
  SettingBloc(this.repository):super(SettingState.initial()){
    on<FetchSetting>(_fetchSetting);
  }
  Future _fetchSetting(SettingEvent event,Emitter<SettingState> emit) async{
    String? id = await Storage.instance.getUID();
    String? token=await Storage.instance.getToken();
    Map<String,dynamic> body={
      'id':id
    };
    final result=await repository.fetchSetting(url:'${dotenv.env['BASE_URL']}${dotenv.env['FETCH_SETTING']}',body:body,header:{
      "Authorization":"Bearer $token"
    });
    return result.fold((l)=>state.copyWith(status: l.status,msg: l.msg), (r)=>state.copyWith(status: r.status,msg: r.msg,result: r.result));
  }
}