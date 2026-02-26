import 'package:vehicle_repair_service/Repository/PhoneAuthRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'PhoneAuthEvent.dart';
part 'PhoneAuthState.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent,PhoneAuthState>{
  final PhoneAuthRepo repo;
  PhoneAuthBloc(this.repo):super(PhoneAuthState.initial()){
    on<SendOtpEvent>(_sendOtp);
    on<VerifyOtpEvent>(_verifyOtp);
  }

  Future<void> _sendOtp(SendOtpEvent event,Emitter<PhoneAuthState> emit) async{
    emit(state.copyWith(status: PhoneAuthStatus.loading));
    final result=await repo.sendOtp(phone: event.phone);
    return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg)), (r)=>emit(state.copyWith(status: r.status,model: r.result)));
  }

  Future<void> _verifyOtp(VerifyOtpEvent event,Emitter<PhoneAuthState> emit) async{
    emit(state.copyWith(status: PhoneAuthStatus.loading));
    final result=await repo.verifyOtp(otp: event.otp);
    return result.fold((l)=>emit(state.copyWith(status: l.status,msg: l.msg)), (r)=>emit(state.copyWith(status: r.status,model: r.result)));
  }

}

