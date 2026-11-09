import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:vehicle_repair_service/core/Services/DioService.dart';
import 'package:vehicle_repair_service/data/entity/book_entity/book_entity.dart';
import 'package:vehicle_repair_service/data/entity/slot_entity/slot_entity.dart';

import '../../core/Services/ApiUtils.dart';
import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseBookRepo {
  Future<Either<Failure, Success>> bookAppointment({
    required String url,
    required Map<String, String> header,
    required FormData body,
  });

  Future<Either<Failure, Success>> fetchSlotHistory({
    required String url,
    Map<String, String> header,
    required FormData body,
  });
}

class BookRepository implements BaseBookRepo {
  BookRepository({Dio? dio}) : _dio = dio ?? DioService.dio;

  final Dio _dio;

  @override
  Future<Either<Failure, Success>> bookAppointment({
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
      final result = BookEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == false) {
            return Left(Failure(status: BookStatus.error, msg: result.msg));
          }
          return Right(
            Success(
              status: BookStatus.completed,
              msg: '${result.msg}',
              result: result,
            ),
          );
        default:
          return Left(Failure(status: BookStatus.error, msg: '${result.msg}'));
      }
    } on FormatException catch (e) {
      log('Format Exception=>$e');
      return Left(Failure(status: BookStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>$e');
      return Left(Failure(status: BookStatus.error, msg: 'Socket Exception'));
    } on CertificateException catch (e) {
      log('Certificate Exception=>$e');
      return Left(
        Failure(status: BookStatus.error, msg: 'Certificate Exception'),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: BookStatus.error, msg: 'Something Went Wrong =>$e!!!'),
      );
    } catch (e) {
      log('Internal Server Error=>$e');
      return Left(
        Failure(status: BookStatus.error, msg: 'Internal Server Error !!!'),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> fetchSlotHistory({
    required String url,
    Map<String, String>? header,
    required FormData body,
  }) async {
    try {
      final resp = await _dio.post(
        url,
        data: body,
        options: Options(headers: header),
      );
      final result = SlotEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == false) {
            return Left(Failure(status: BookStatus.error, msg: result.msg));
          }
          return Right(
            Success(
              status: BookStatus.completed,
              msg: '${result.msg}',
              result: result.result ?? const [],
            ),
          );
        default:
          return Left(Failure(status: BookStatus.error, msg: '${result.msg}'));
      }
    } on FormatException catch (e) {
      log('Format Exception=>$e');
      return Left(Failure(status: BookStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>$e');
      return Left(Failure(status: BookStatus.error, msg: 'Socket Exception'));
    } on CertificateException catch (e) {
      log('Certificate Exception=>$e');
      return Left(
        Failure(status: BookStatus.error, msg: 'Certificate Exception'),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: BookStatus.error, msg: 'Something Went Wrong!!!'),
      );
    } catch (e) {
      log('Booking Error message=>${e.toString()}');
      return Left(
        Failure(status: BookStatus.error, msg: 'Internal Server Error !!!'),
      );
    }
  }
}
