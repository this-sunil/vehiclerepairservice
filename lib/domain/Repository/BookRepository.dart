import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:vehicle_repair_service/core/Services/DioService.dart';

import '../../core/Bloc/BookBloc/BookBloc.dart';
import '../../data/Model/BookingModel.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/SlotHistoryModel.dart';
import '../../data/Model/Success.dart';

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
  @override
  Future<Either<Failure, Success>> bookAppointment({
    required String url,
    required Map<String, String> header,
    required FormData body,
  }) async {
    // TODO: implement bookAppoint
    try {
      final resp = await DioService.post(
        url,
        options: Options(headers: header),
        data: body,
      );
      print("Resp=>${resp.statusCode}");
      final result = await Isolate.run(() => BookingModel.fromJson(resp.data));

      switch (resp.statusCode) {
        case 200:
          return Right(
            Success(
              status: BookStatus.completed,
              msg: "${result.msg}",
              result: result,
            ),
          );
        case 400 || 404:
          return Left(Failure(status: BookStatus.error, msg: "${result.msg}"));
        default:
          return Left(Failure(status: BookStatus.error, msg: "${result.msg}"));
      }
    } on FormatException catch (e, stk) {
      log("Format Exception=>$stk");
      return Left(
        Failure(status: BookStatus.error, msg: "Format Exception $e"),
      );
    } on SocketException catch (e) {
      log("Socket Exception=>$e");
      return Left(Failure(status: BookStatus.error, msg: "Socket Exception"));
    } on CertificateException catch (e) {
      log("Certificate Exception=>$e");
      return Left(
        Failure(status: BookStatus.error, msg: "Certificate Exception"),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: BookStatus.error, msg: "Something Went Wrong!!!"),
      );
    } catch (e, stk) {
      print("object=>$e");
      return Left(
        Failure(status: BookStatus.error, msg: "Internal Server Error !!!"),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> fetchSlotHistory({
    required String url,
    Map<String, String>? header,
    required FormData body,
  }) async {
    // TODO: implement fetchSlotHistory
    try {
      final resp = await DioService.post(
        url,
        data: body,
        options: Options(headers: header),
      );
      final result = await Isolate.run(
        () => SlotHistoryModel.fromJson(resp.data),
      );
      log("Slot History=>${resp.data}");
      switch (resp.statusCode) {
        case 200:
          return Right(
            Success(
              status: BookStatus.completed,
              msg: "${result.msg}",
              result: result,
            ),
          );

        case 400 || 404:
          return Left(Failure(status: BookStatus.error, msg: "${result.msg}"));
        default:
          return Left(Failure(status: BookStatus.error, msg: "${result.msg}"));
      }
    } on FormatException catch (e) {
      log("Format Exception=>$e");
      return Left(Failure(status: BookStatus.error, msg: "Format Exception"));
    } on SocketException catch (e) {
      log("Socket Exception=>$e");
      return Left(Failure(status: BookStatus.error, msg: "Socket Exception"));
    } on CertificateException catch (e) {
      log("Certificate Exception=>$e");
      return Left(
        Failure(status: BookStatus.error, msg: "Certificate Exception"),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: BookStatus.error, msg: "Something Went Wrong!!!"),
      );
    } catch (e) {
      print("Booking Error message=>${e.toString()}");
      return Left(
        Failure(status: BookStatus.error, msg: "Internal Server Error !!!"),
      );
    }
  }
}
