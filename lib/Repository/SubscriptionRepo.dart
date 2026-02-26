import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:vehicle_repair_service/Bloc/SubscriptionBloc/SubscriptionBloc.dart';
import 'package:vehicle_repair_service/Model/Failure.dart';
import 'package:vehicle_repair_service/Model/SubscriptionModel.dart';
import 'package:vehicle_repair_service/Model/Success.dart';

abstract class BaseSubscriptionRepo{
  Future<Either<Failure,Success>> fetchSubscription({required String url,Map<String,dynamic> body,Map<String,String> header});
}
class SubscriptionRepo extends BaseSubscriptionRepo{

  @override
  Future<Either<Failure, Success>> fetchSubscription({required String url, Map<String, dynamic>? body, Map<String, String>? header}) async{
    // TODO: implement fetchSubscription
    try{
      final resp=await post(Uri.parse(url),body: body,headers: header);
      final result=subscriptionModelFromJson(resp.body);
      log("\n Response Plan =>${resp.body}");
      switch(resp.statusCode){
        case 200:
          if(result.status==true) {
            return Right(Success(status: SubscriptionStatus.completed,msg: result.msg,result: result));
          }
          else{
            return Left(Failure(status: SubscriptionStatus.error,msg: result.msg));
          }
        default:
          return Left(Failure(status: SubscriptionStatus.error,msg: 'Internal Server Error'));
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
    catch(e,stk){
      log("message=>${stk.toString()}");
      return Left(Failure(status: SubscriptionStatus.error,msg: "Internal Server Error"));
    }
  }


}