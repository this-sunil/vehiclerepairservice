import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:vehicle_repair_service/data/entity/auth_entity/auth_entity.dart';

import '../../core/Services/ApiUtils.dart';
import '../../core/Services/DioService.dart';
import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Success>> login({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  });

  Future<Either<Failure, Success>> register({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, Success>> fetchProfile({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, Success>> updateProfile({
    required String url,
    required Map<String, String> header,
    required FormData body,
  });
}

class AuthRepository implements BaseAuthRepository {
  AuthRepository({Dio? dio}) : _dio = dio ?? DioService.dio;

  final Dio _dio;

  @override
  Future<Either<Failure, Success>> login({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    try {
      final resp = await _dio.post(
        url,
        data: body,
        options: Options(headers: header),
      );
      final result = AuthEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == true) {
            return Right(
              Success(
                status: AuthStatus.login,
                msg: result.msg,
                result: result,
              ),
            );
          }
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Socket Exception'));
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: AuthStatus.error, msg: 'Something Went Wrong!!!'),
      );
    } catch (e) {
      log('Internal Server Error =>$e');
      return Left(
        Failure(status: AuthStatus.error, msg: 'Internal Server Error'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> register({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    try {
      final resp = await _dio.post(
        url,
        data: body,
        options: Options(headers: header),
      );
      final result = AuthEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == true) {
            return Right(
              Success(
                status: AuthStatus.register,
                msg: result.msg,
                result: result,
              ),
            );
          }
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Socket Exception'));
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: AuthStatus.error, msg: 'Something Went Wrong!!!'),
      );
    } catch (e) {
      log('Internal Server Error =>$e');
      return Left(
        Failure(status: AuthStatus.error, msg: 'Internal Server Error'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> fetchProfile({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    try {
      final resp = await _dio.post(
        url,
        data: body,
        options: Options(headers: header),
      );
      final result = AuthEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == false) {
            return Left(Failure(status: AuthStatus.error, msg: result.msg));
          }
          return Right(
            Success(
              status: AuthStatus.fetchProfile,
              msg: result.msg,
              result: result,
            ),
          );
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Socket Exception'));
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: AuthStatus.error, msg: 'Something Went Wrong!!!'),
      );
    } catch (e) {
      log('Internal Server Error =>$e');
      return Left(
        Failure(status: AuthStatus.error, msg: 'Internal Server Error'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> updateProfile({
    required String url,
    required Map<String, String> header,
    required FormData body,
  }) async {
    try {
      final resp = await _dio.post(
        url,
        options: Options(headers: header),
        data: body,
      );
      final result = AuthEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == false) {
            return Left(Failure(status: AuthStatus.error, msg: result.msg));
          }
          return Right(
            Success(status: AuthStatus.update, msg: result.msg, result: result),
          );
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Socket Exception'));
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: AuthStatus.error, msg: 'Something Went Wrong!!!'),
      );
    } catch (e) {
      log('Internal Server Error =>$e');
      return Left(
        Failure(status: AuthStatus.error, msg: 'Internal Server Error !!!'),
      );
    }
  }
}
