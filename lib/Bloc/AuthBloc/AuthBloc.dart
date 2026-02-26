import 'dart:io';

import 'package:vehicle_repair_service/Model/AuthModel.dart';
import 'package:vehicle_repair_service/Repository/AuthRepository.dart';
import 'package:vehicle_repair_service/Widget/Storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'AuthEvent.dart';
part 'AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(AuthState.initial()) {
    on<LoginEvent>(_loginApi);
    on<RegisterEvent>(_registerApi);
    on<FetchProfileEvent>(_fetchProfileApi);
    on<UpdateProfileEvent>(_updateProfileApi);
  }

  Future<void> _loginApi(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await repository.login(
      url: '${dotenv.env['BASE_URL']}${dotenv.env["LOGIN"]}',
      header: {"Content-Type": "application/json"},
      body: {"phone": event.phone, "pass": event.pass},
    );
    return result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg)),
      (r) =>
          emit(state.copyWith(status: r.status, msg: r.msg, result: r.result)),
    );
  }

  Future<void> _registerApi(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    Map<String, dynamic> body = {
      "name": event.name,
      "phone": event.phone,
      "pass": event.pass,
    };
    final result = await repository.register(
      url: '${dotenv.env['BASE_URL']}${dotenv.env["REGISTER"]}',
      header: {"Content-Type": "application/json"},
      body: body,
    );
    return result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg)),
      (r) => emit(state.copyWith(status: r.status, msg: r.msg, result: r.result))
    );
  }

  Future<void> _fetchProfileApi(
    FetchProfileEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    String? id = await Storage.instance.getUID();
    String? token = await Storage.instance.getToken();
    Map<String, dynamic> body = {"id": id};
    final result = await repository.fetchProfile(
      url: '${dotenv.env['BASE_URL']}${dotenv.env["FETCH_PROFILE"]}',
      header: {"Content-Type": "application/json","Authorization":"Bearer $token"},
      body: body
    );
    return result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg)),
      (r) => emit(state.copyWith(status: r.status, msg: r.msg, result: r.result)));
  }

  Future<void> _updateProfileApi(
    UpdateProfileEvent event,
    Emitter<AuthState> emit
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    String? id = await Storage.instance.getUID();
    String? token = await Storage.instance.getToken();
    Map<String, String> body = event.file == null
        ? {
            'id': id.toString(),
            'name': '${event.name}',
            'phone': '${event.phone}',
          }
        : {
            'id': id.toString(),
            'name': '${event.name}',
            'phone': '${event.phone}',
            'photo': '${event.file?.path}',
          };
    final result = await repository.updateProfile(
      url: '${dotenv.env['BASE_URL']}${dotenv.env['UPDATE_PROFILE']}',
      body: body,
      header: {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization':'Bearer $token'
      },
    );
    return result.fold(
      (l) => emit(state.copyWith(status: l.status, msg: l.msg)),
      (r) => emit(state.copyWith(status: r.status, msg: r.msg, result: r.result)),
    );
  }
}
