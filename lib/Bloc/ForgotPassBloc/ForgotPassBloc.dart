import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'ForgotPassEvent.dart';
part 'ForgotPassState.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc() : super(ForgotPassState.initial()) {
    on<SendOtpEvent>(_sendOtp);
    on<VerifyOtpEvent>(_verifyOtp);
    on<SetForgotPassEvent>(_setForgotPass);
  }

  Future<void> _sendOtp(SendOtpEvent event, Emitter<ForgotPassState> emit) async {
    emit(state.copyWith(status: ForgotStatus.send));
  }

  Future<void> _verifyOtp(VerifyOtpEvent event, Emitter<ForgotPassState> emit) async {
    emit(state.copyWith(status: ForgotStatus.loading));
    await Future.delayed(Duration(seconds: 2), () {
      emit(state.copyWith(status: ForgotStatus.verify));
    });
  }

  Future<void> _setForgotPass(SetForgotPassEvent event, Emitter<ForgotPassState> emit) async {

  }
}
