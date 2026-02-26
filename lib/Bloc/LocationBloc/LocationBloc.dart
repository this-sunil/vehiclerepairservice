import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_repair_service/Repository/LocationRepository.dart';
import '../../Model/LocationModel.dart';
part 'LocationEvent.dart';
part 'LocationState.dart';

class LocationBloc extends Bloc<LocationEvent,LocationState>{
  final LocationRepository repository;
  LocationBloc(this.repository):super(LocationState.initial()){
    on<FetchLocationEvent>(_fetchLocation);
  }

  Future<void> _fetchLocation(FetchLocationEvent event,Emitter<LocationState> emit) async{
    emit(state.copyWith(status: LocationStatus.loading));
    final result=await repository.fetchLocation();
    return result.fold((l)=> emit(state.copyWith(status: l.status,msg: l.msg)), (r)=>emit(state.copyWith(status: r.status,msg: r.msg,model: r.result)));
  }
}
