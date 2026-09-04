import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:vehicle_repair_service/data/entity/setting_entity/setting_entity.dart';
import '../../core/Bloc/SettingBloc/SettingBloc.dart';
import '../../core/Services/DioService.dart';

import 'package:either_dart/either.dart';

import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseSettingRepo {
  Future<Either<Failure, Success>> fetchSetting({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  });
}

class SettingRepository implements BaseSettingRepo {
  @override
  Future<Either<Failure, Success>> fetchSetting({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    // TODO: implement fetch Setting
    try {
      final resp = await DioService.post(
        url,
        data: jsonEncode(body),
        options: Options(headers: header),
      );
      final result = await Isolate.run(() => SettingEntity.fromJson(resp.data));
      switch (resp.statusCode) {
        case 200:
          return Right(
            Success(
              status: SettingStatus.completed,
              msg: result.msg,
              result: result,
            ),
          );
        case 400 || 404:
          return Left(Failure(status: SettingStatus.error, msg: result.msg));
        default:
          return Left(
            Failure(status: SettingStatus.completed, msg: result.msg),
          );
      }
    } on FormatException catch (e) {
      log("Format Exception=>${e.message}");
      return Left(
        Failure(status: SettingStatus.error, msg: 'Format Exception'),
      );
    } on SocketException catch (e) {
      log("Socket Exception=>${e.message}");
      return Left(
        Failure(status: SettingStatus.error, msg: 'Socket Exception'),
      );
    } on TimeoutException catch (e) {
      log("TimeOut Exception=>${e.message}");
      return Left(
        Failure(status: SettingStatus.error, msg: 'Poor Internet Connection'),
      );
    } on CertificateException catch (e) {
      log("Certificate Exception=>${e.message}");
      return Left(
        Failure(status: SettingStatus.error, msg: 'Bad Certificate Exception'),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: SettingStatus.error, msg: "Something Went Wrong!!!"),
      );
    } catch (e) {
      return Left(
        Failure(msg: 'Internal Server Error', status: SettingStatus.error),
      );
    }
  }
}
