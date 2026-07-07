import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:vehicle_repair_service/core/Services/DioService.dart';

import '../../data/Model/Failure.dart';
import '../../data/Model/ServiceModel.dart';
import '../../data/Model/Success.dart';
import '../../core/Bloc/ServiceBloc/ServiceBloc.dart';
import 'package:either_dart/either.dart';

abstract class BaseServiceRepo{
  Future<Either<Failure,Success>> fetchService({required String url,Map<String,String>? header,Map<String,dynamic>? body});
  Future<Either<Failure,Success>> searchService({required String url,Map<String,String>? header,Map<String,dynamic>? body});
}
class ServiceRepository implements BaseServiceRepo{

  @override
  Future<Either<Failure, Success>> fetchService({required String url, Map<String, String>? header,Map<String,dynamic>? body}) async{
    // TODO: implement fetchService
    try{
      final resp=await DioService.post(url,options: Options(
        headers: header
      ),data: body);
      log("Service Status=>${resp.data}");
      final result =  await Isolate.run(()=>ServiceModel.fromJson(resp.data));

      switch(resp.statusCode){
        case 200:
          return result.result!.isEmpty?Left(Failure(status: ServiceStatus.error,msg: result.msg)):Right(Success(status: ServiceStatus.completed,msg: result.msg,result: result.result));
        case 400:
          return Left(Failure(status: ServiceStatus.error,msg:result.msg));
        default:
          return Left(Failure(status: ServiceStatus.error,msg: result.msg));
      }
    }
    catch(e,stk){

      return Left(Failure(status: ServiceStatus.error,msg: "Internal Server Error"));
    }
  }

  @override
  Future<Either<Failure, Success>> searchService({required String url, Map<String, String>? header, Map<String, dynamic>? body}) async{
    // TODO: implement searchService
    try{
      final resp=await DioService.post(url,options: Options(
        headers: header
      ),data: body);
      final result = await Isolate.run(()=> ServiceModel.fromJson(resp.data));
      switch(resp.statusCode){
        case 200:
          return Right(Success(status: ServiceStatus.completed,msg: result.msg,result: result.result));
        case 400:
        case 404:
          return Left(Failure(status: ServiceStatus.error,msg: result.msg));
        default:
          return Left(Failure(status: ServiceStatus.error,msg: result.msg));
      }
    }
    catch(e,stk){
      log("Message=>$stk");
      return Left(Failure(status: ServiceStatus.error,msg: "Internal Server Error"));
    }
  }

}
