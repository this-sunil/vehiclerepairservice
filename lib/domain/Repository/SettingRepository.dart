import 'dart:convert';
import 'dart:isolate';
import 'package:dio/dio.dart';
import '../../core/Bloc/SettingBloc/SettingBloc.dart';
import '../../core/Services/DioService.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/SettingModel.dart';
import '../../data/Model/Success.dart';
import 'package:either_dart/either.dart';

abstract class BaseSettingRepo {
  Future<Either<Failure, Success>> fetchSetting({
    required String url,
    Map<String,String>? header,
    required Map<String,dynamic> body
  });
}

class SettingRepository implements BaseSettingRepo {
  @override
  Future<Either<Failure, Success>> fetchSetting({
    required String url,
    Map<String,String>? header,
    required Map<String,dynamic> body
  }) async {
    // TODO: implement fetch Setting
    try {
      final resp = await DioService.post(url,data: jsonEncode(body),options: Options(
        headers: header
      ));
      final result =  await Isolate.run(()=>SettingModel.fromJson(resp.data));
      switch (resp.statusCode) {
        case 200:
          return Right(Success(status: SettingStatus.completed, msg: result.msg, result: result));
        case 400 || 404:
          return Left(Failure(status: SettingStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: SettingStatus.completed, msg: result.msg));
      }
    } catch (e) {
      return Left(Failure(msg: 'Internal Server Error', status: SettingStatus.error));
    }
  }
}
