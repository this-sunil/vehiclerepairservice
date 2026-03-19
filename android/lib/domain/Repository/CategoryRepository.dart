import 'dart:developer';
import 'dart:io';
import '../../data/Model/CategoryModel.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/Success.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import '../../core/Bloc/CategoryBloc/CategoryBloc.dart';

abstract class BaseCatRepo {
  Future<Either<Failure,Success>> fetchCat({required String url,Map<String,String> header});
}
class CategoryRepository implements BaseCatRepo{

  @override
  Future<Either<Failure, Success>> fetchCat({required String url, Map<String, String>? header}) async{
    // TODO: implement fetchCat
    try{
      final resp=await post(Uri.parse(url),headers: header);
      final result = categoryModelFromJson(resp.body);
      log("message=>${resp.body}");
      switch(resp.statusCode){
        case 200:
          return Right(Success(status: CatStatus.completed,msg: result.msg,result: result.result));
        case 400:
        case 404:
        return Left(Failure(status: CatStatus.error,msg:result.msg));
        default:
          return Left(Failure(status: CatStatus.error,msg:"No Response"));
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
    catch(e,stk) {
      log("Internal Server Error=>${stk.toString()}");
      return Left(Failure(status: CatStatus.error,msg: 'Internal Server Error'));
    }
  }

}