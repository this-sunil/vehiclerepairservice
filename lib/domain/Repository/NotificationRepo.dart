import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:vehicle_repair_service/core/Services/DioService.dart';
import 'package:vehicle_repair_service/data/entity/notification_entity/notification_entity.dart';
import '../../core/Bloc/NotificationBloc/NotificationBloc.dart';
import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseNotificationRepo {
  Future<Either<Failure, Success>> fetchNotification({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  });
}

class NotificationRepository extends BaseNotificationRepo {
  @override
  Future<Either<Failure, Success>> fetchNotification({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    // TODO: implement fetchNotification
    try {
      final resp = await DioService.post(
        url,
        options: Options(headers: header),
        data: body,
      );
      log("Notification Response=> ${resp.data}");

      final result = await Isolate.run(
        () => NotificationEntity.fromJson(resp.data),
      );
      switch (resp.statusCode) {
        case 200:
          return result.result!.isEmpty
              ? Left(Failure(status: NotificationStatus.error, msg: result.msg))
              : Right(
                  Success(
                    status: NotificationStatus.completed,
                    msg: result.msg,
                    result: result.result,
                  ),
                );

        default:
          return Left(
            Failure(status: NotificationStatus.error, msg: result.msg),
          );
      }
    } on FormatException catch (e) {
      log("message=>$e");
      return Left(
        Failure(status: NotificationStatus.error, msg: 'Format Exception'),
      );
    } on CertificateException catch (e) {
      log("message=>$e");
      return Left(
        Failure(status: NotificationStatus.error, msg: 'Format Exception'),
      );
    } on SocketException catch (e) {
      log("message=>$e");
      return Left(
        Failure(status: NotificationStatus.error, msg: 'Socket Exception'),
      );
    } on DioException catch (e) {
      print(e.message.toString());
      return Left(
        Failure(
          status: NotificationStatus.error,
          msg: "Something Went Wrong $e!!!",
        ),
      );
    } catch (e) {
      log("message=>$e");
      return Left(
        Failure(
          status: NotificationStatus.error,
          msg: 'Internal Server Error !!!',
        ),
      );
    }
  }
}
