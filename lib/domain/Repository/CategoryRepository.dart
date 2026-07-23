import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';

import '../../core/Services/DioService.dart';
import '../../data/Model/CategoryModel.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/Success.dart';
import 'package:either_dart/either.dart';

import '../../core/Bloc/CategoryBloc/CategoryBloc.dart';

abstract class BaseCatRepo {
  Future<Either<Failure,Success>> fetchCat({required String url,Map<String,String> header});
}
class CategoryRepository implements BaseCatRepo{

  @override
  Future<Either<Failure, Success>> fetchCat({required String url, Map<String, String>? header}) async{
    // TODO: implement fetchCat
    try{
      final resp=await DioService.get(url,options: Options(headers: header));
      log("Category message=>${resp.data}");
      final result = await Isolate.run(()=>CategoryModel.fromJson(resp.data));

      switch(resp.statusCode){
        case 200:
          return Right(Success(status: CatStatus.completed,msg: result.msg,result: result.result));
        case 400:
          return Left(Failure(status: CatStatus.error,msg:result.msg));
        default:
          return Left(Failure(status: CatStatus.error,msg:result.msg));
      }
    }
    on FormatException catch(e){
      log("Format Exception=>${e.message}");
      return Left(Failure(status: CatStatus.error,msg: e.message));
    }
    on SocketException catch(e){
      log("Socket Exception=>${e.message}");
      return Left(Failure(status: CatStatus.error,msg: e.message));
    }
    on CertificateException catch(e){
      log("Certificate Exception=>${e.message}");
      return Left(Failure(status: CatStatus.error,msg: e.message));
    }
    on DioException catch (e) {
      log(e.message.toString());
      return Left(
        Failure(status: CatStatus.error, msg: "Something Went Wrong!!!"),
      );
    }
    catch(e) {
      log("Internal Server Error=>${e.toString()}");
      return Left(Failure(status: CatStatus.error,msg: 'Internal Server Error'));
    }
  }

}