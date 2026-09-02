import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../core/Bloc/SubscriptionBloc/SubscriptionBloc.dart';
import '../../core/Services/DioService.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/SubscriptionModel.dart';
import '../../data/Model/Success.dart';

abstract class BaseSubscriptionRepo{
  Future<Either<Failure,Success>> fetchSubscription({required String url,Map<String,dynamic> body,Map<String,String> header});
}
class SubscriptionRepo extends BaseSubscriptionRepo{

  @override
  Future<Either<Failure, Success>> fetchSubscription({required String url, Map<String, dynamic>? body, Map<String, String>? header}) async{
    // TODO: implement fetchSubscription
    try{
      final resp=await DioService.post(url,data: jsonEncode(body),options: Options(
        headers: header
      ));
      final result=await Isolate.run(()=>SubscriptionModel.fromJson(resp.data));
      log("\n Response Plan =>${result.status}");
      switch(resp.statusCode){
        case 200:
          if(result.status==true) {
            return Right(Success(status: SubscriptionStatus.completed,msg: result.msg,result: result));
          }
          else{
            return Left(Failure(status: SubscriptionStatus.error,msg: result.msg));
          }
        default:
          return Left(Failure(status: SubscriptionStatus.error,msg: result.msg));
      }
    }
    on FormatException catch(e){
      log("Format Exception=>${e.message}");
      return Left(Failure(status: SubscriptionStatus.error,msg: 'Format Exception'));
    }
    on SocketException catch(e){
      log("Socket Exception=>${e.message}");
      return Left(Failure(status: SubscriptionStatus.error,msg: 'Socket Exception'));
    }
    on TimeoutException catch(e){
      log("TimeOut Exception=>${e.message}");
      return Left(Failure(status: SubscriptionStatus.error,msg: 'Poor Internet Connection'));
    }
    on CertificateException catch(e){
      log("Certificate Exception=>${e.message}");
      return Left(Failure(status: SubscriptionStatus.error,msg: 'Bad Certificate Exception'));
    }
    on DioException catch (e) {
      print(e.message.toString());
      return Left(
        Failure(status: SubscriptionStatus.error, msg: "Something Went Wrong!!!"),
      );
    }
    catch(e,stk){
      print("message=>${stk.toString()}");
      return Left(Failure(status: SubscriptionStatus.error,msg: "Internal Server Error $stk!!!"));
    }
  }


}