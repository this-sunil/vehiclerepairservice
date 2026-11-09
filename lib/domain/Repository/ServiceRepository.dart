import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:vehicle_repair_service/data/entity/service_entity/service_entity.dart';

import '../../core/Services/ApiUtils.dart';
import '../../core/Services/DioService.dart';
import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseServiceRepo {
  Future<Either<Failure, Success>> fetchService({
    required String url,
    Map<String, String>? header,
    required FormData body,
  });

  Future<Either<Failure, Success>> searchService({
    required String url,
    Map<String, String>? header,
    required FormData body,
  });
}

class ServiceRepository implements BaseServiceRepo {
  ServiceRepository({Dio? dio}) : _dio = dio ?? DioService.dio;

  final Dio _dio;

  @override
  Future<Either<Failure, Success>> fetchService({
    required String url,
    Map<String, String>? header,
    required FormData body,
  }) async {
    return _fetch(url: url, header: header, body: body);
  }

  @override
  Future<Either<Failure, Success>> searchService({
    required String url,
    Map<String, String>? header,
    required FormData body,
  }) async {
    return _fetch(url: url, header: header, body: body);
  }

  Future<Either<Failure, Success>> _fetch({
    required String url,
    Map<String, String>? header,
    required FormData body,
  }) async {
    try {
      final resp = await _dio.post(
        url,
        options: Options(headers: header),
        data: body,
      );
      final result = ServiceEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          final items = result.result ?? const <Result>[];
          return Right(
            Success(
              status: ServiceStatus.completed,
              msg: result.msg,
              result: items,
            ),
          );
        default:
          return Left(Failure(status: ServiceStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>$e');
      return Left(
        Failure(status: ServiceStatus.error, msg: 'Format Exception'),
      );
    } on SocketException catch (e) {
      log('Socket Exception=>$e');
      return Left(
        Failure(status: ServiceStatus.error, msg: 'Socket Exception'),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: ServiceStatus.error, msg: 'Something Went Wrong!!!'),
      );
    } catch (e) {
      log('Internal Server Error=>$e');
      return Left(
        Failure(status: ServiceStatus.error, msg: 'Internal Server Error'),
      );
    }
  }
}
