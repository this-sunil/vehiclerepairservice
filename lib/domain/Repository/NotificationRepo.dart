import 'dart:developer';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import '../../core/Bloc/NotificationBloc/NotificationBloc.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/NotificationModel.dart';
import '../../data/Model/Success.dart';

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
      final resp = await post(Uri.parse(url), headers: header, body: body);
      log("Notification Response=> ${resp.body}");

      final result = notificationModelFromJson(resp.body);
      switch (resp.statusCode) {
        case 200:
          return result.result!.isEmpty
              ? Left(Failure(status: NotificationStatus.error, msg: result.msg))
              : Right(Success(
                    status: NotificationStatus.completed,
                    msg: result.msg,
                    result: result.result
                  ));
        case 400 || 404:
          return Left(Failure(status: NotificationStatus.error, msg: result.msg));

        default:
          return Left(
            Failure(
              status: NotificationStatus.error,
              msg: 'Internal Server Error !!!',
            ),
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
        Failure(status: NotificationStatus.error, msg: 'Format Exception'),
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
