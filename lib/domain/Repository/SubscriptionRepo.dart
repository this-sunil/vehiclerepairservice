import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:vehicle_repair_service/data/entity/subscription_entity/subscription_entity.dart';

import '../../core/Services/ApiUtils.dart';
import '../../core/Services/DioService.dart';
import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseSubscriptionRepo {
  Future<Either<Failure, Success>> fetchSubscription({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  });
}

class SubscriptionRepo extends BaseSubscriptionRepo {
  SubscriptionRepo();

  @override
  Future<Either<Failure, Success>> fetchSubscription({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      final resp = await DioService.post(
        url,
        data: body,
        options: Options(headers: header),
      );
      final result = SubscriptionEntity.fromJson(asJsonMap(resp.data));

      switch (resp.statusCode) {
        case 200:
          if (result.status == false) {
            return Left(
              Failure(status: SubscriptionStatus.error, msg: result.msg),
            );
          }
          return Right(
            Success(
              status: SubscriptionStatus.completed,
              msg: result.msg,
              result: result,
            ),
          );
        default:
          return Left(
            Failure(status: SubscriptionStatus.error, msg: result.msg),
          );
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(
        Failure(status: SubscriptionStatus.error, msg: 'Format Exception'),
      );
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(
        Failure(status: SubscriptionStatus.error, msg: 'Socket Exception'),
      );
    } on TimeoutException catch (e) {
      log('TimeOut Exception=>${e.message}');
      return Left(
        Failure(
          status: SubscriptionStatus.error,
          msg: 'Poor Internet Connection',
        ),
      );
    } on CertificateException catch (e) {
      log('Certificate Exception=>${e.message}');
      return Left(
        Failure(
          status: SubscriptionStatus.error,
          msg: 'Bad Certificate Exception',
        ),
      );
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(
          status: SubscriptionStatus.error,
          msg: 'Something Went Wrong!!!',
        ),
      );
    } catch (e, stk) {
      log('Internal Server Error=>${stk.toString()}');
      return Left(
        Failure(status: SubscriptionStatus.error, msg: 'Internal Server Error'),
      );
    }
  }
}
