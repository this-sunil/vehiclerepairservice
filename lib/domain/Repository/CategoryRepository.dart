import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:vehicle_repair_service/data/entity/cat_entity/cat_entity.dart';

import '../../core/Services/ApiUtils.dart';
import '../../core/Services/DioService.dart';
import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseCatRepo {
  Future<Either<Failure, Success>> fetchCat({
    required String url,
    Map<String, String> header,
  });
}

class CategoryRepository implements BaseCatRepo {
  CategoryRepository();

  @override
  Future<Either<Failure, Success>> fetchCat({
    required String url,
    Map<String, String>? header,
  }) async {
    try {
      final resp = await DioService.get(url, options: Options(headers: header));
      final result = CatEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == false) {
            return Left(Failure(status: CatStatus.error, msg: result.msg));
          }
          return Right(
            Success(
              status: CatStatus.completed,
              msg: result.msg,
              result: result.result ?? const [],
            ),
          );
        default:
          return Left(Failure(status: CatStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: CatStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: CatStatus.error, msg: 'Socket Exception'));
    } on CertificateException catch (e) {
      log('Certificate Exception=>${e.message}');
      return Left(
        Failure(status: CatStatus.error, msg: 'Certificate Exception'),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: CatStatus.error, msg: 'Something Went Wrong!!!'),
      );
    } catch (e) {
      log('Internal Server Error=>${e.toString()}');
      return Left(
        Failure(status: CatStatus.error, msg: 'Internal Server Error'),
      );
    }
  }
}
