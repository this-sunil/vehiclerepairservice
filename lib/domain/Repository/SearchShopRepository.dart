import 'dart:developer';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import '../../core/Bloc/ShopBloc/ShopBloc.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/ShopModel.dart';
import '../../data/Model/Success.dart';

abstract class BaseSearchShopRepo{
  Future<Either<Failure,Success>> searchByCity({required String url,Map<String,String>? header,required Map<String,dynamic> body});
}
class SearchShopRepo extends BaseSearchShopRepo{
  @override
  Future<Either<Failure, Success>> searchByCity({required String url, Map<String, String>? header, required Map<String, dynamic> body}) async{
    // TODO: implement searchByCity
    try{
      final resp=await post(Uri.parse(url),headers: header,body: body);
      log("Response=>${resp.body}");
      final result=shopModelFromJson(resp.body);
      switch(resp.statusCode){
        case 200:
          return Right(Success(status: ShopStatus.completed,msg: result.msg,result: result.result));
        case 400 || 404:
          return Left(Failure(status: ShopStatus.error,msg: result.msg));
        default:
          return Left(Failure(status: ShopStatus.error,msg: result.msg));

      }
    }
    on FormatException catch(e){
      log("Format Exception=>$e");
      return Left(Failure(status: ShopStatus.error,msg: 'Format Exception'));
    }
    on SocketException catch(e){
      log("Socket Exception=>$e");
      return Left(Failure(status: ShopStatus.error,msg: 'Socket Exception'));
    }
    on CertificateException catch(e){
      log("Certificate Exception=>$e");
      return Left(Failure(status: ShopStatus.error,msg: 'Invalid Certificate'));
    }
    on HandshakeException catch(e){
      log("Handshake Exception=>$e");
      return Left(Failure(status: ShopStatus.error,msg: 'Handshake Exception'));
    }
    catch(e,stk){
      log("message=>${stk.toString()}");
      return Left(Failure(status: ShopStatus.error,msg: 'Internal Server Error'));
    }
  }

}