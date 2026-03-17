import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'InternetEvent.dart';
part 'InternetState.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetState.initial()) {
    on<FetchInternetEvent>(_fetchInternetEvent);
  }

  Future<void> _fetchInternetEvent(
      FetchInternetEvent event,
      Emitter<InternetState> emit,
      ) async {
    emit(state.copyWith(status: InternetStatus.loading));

    await emit.forEach<List<ConnectivityResult>>(
      Connectivity().onConnectivityChanged,
      onData: (result) {
        if (result.contains(ConnectivityResult.mobile)) {
          return state.copyWith(
            status: InternetStatus.completed,
            msg: "Mobile Internet Connected !!!"
          );
        } else if (result.contains(ConnectivityResult.wifi)) {
          return state.copyWith(
            status: InternetStatus.completed,
            msg: "WiFi Connected Successfully !!!"
          );
        } else if (result.contains(ConnectivityResult.ethernet)) {
          return state.copyWith(
            status: InternetStatus.completed,
            msg: "Ethernet Connected Successfully !!!"
          );
        } else if (result.contains(ConnectivityResult.vpn)) {
          return state.copyWith(
            status: InternetStatus.completed,
            msg: "VPN Connected Successfully !!!"
          );
        }
        return state.copyWith(
            status: InternetStatus.error,
            msg: "No Internet Connection !!!"
          );

      },
      onError: (_, stackTrace) => state.copyWith(
        status: InternetStatus.error,
        msg: "Connectivity Error"
      ),
    );
  }
}

