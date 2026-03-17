import 'dart:developer';
import '../../data/Model/Failure.dart';
import '../../data/Model/ServiceModel.dart';
import '../../data/Model/Success.dart';
import '../../core/Bloc/ServiceBloc/ServiceBloc.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';

abstract class BaseServiceRepo{
  Future<Either<Failure,Success>> fetchService({required String url,Map<String,String>? header,Map<String,String>? body});
  Future<Either<Failure,Success>> searchService({required String url,Map<String,String>? header,Map<String,String>? body});
}
class ServiceRepository implements BaseServiceRepo{

  @override
  Future<Either<Failure, Success>> fetchService({required String url, Map<String, String>? header,Map<String,String>? body}) async{
    // TODO: implement fetchService
    try{
      final resp=await post(Uri.parse(url),headers: header,body: body);
      final result =  serviceModelFromJson(resp.body);
      switch(resp.statusCode){
        case 200:
          return Right(Success(status: ServiceStatus.completed,msg: result.msg,result: result.result));
        case 400:
        case 404:
          return Left(Failure(status: ServiceStatus.error,msg: result.msg));
        default:
          return Left(Failure(status: ServiceStatus.error,msg: "No Response !!!"));
      }
    }
    catch(e){
      log("Message=>$e");
      return Left(Failure(status: ServiceStatus.error,msg: "Internal Server Error"));
    }
  }

  @override
  Future<Either<Failure, Success>> searchService({required String url, Map<String, String>? header, Map<String, String>? body}) async{
    // TODO: implement searchService
    try{
      final resp=await post(Uri.parse(url),headers: header,body: body);
      final result =  serviceModelFromJson(resp.body);
      switch(resp.statusCode){
        case 200:
          return Right(Success(status: ServiceStatus.completed,msg: result.msg,result: result.result));
        case 400:
        case 404:
          return Left(Failure(status: ServiceStatus.error,msg: result.msg));
        default:
          return Left(Failure(status: ServiceStatus.error,msg: "No Response !!!"));
      }
    }
    catch(e){
      log("Message=>$e");
      return Left(Failure(status: ServiceStatus.error,msg: "Internal Server Error"));
    }
  }

}
