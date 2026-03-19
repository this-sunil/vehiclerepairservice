import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../../core/Bloc/BookBloc/BookBloc.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/SlotHistoryModel.dart';
import '../../data/Model/Success.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';

abstract class BaseBookRepo{
  Future<Either<Failure,Success>> bookAppointment({required String url,required Map<String,String> header,required Map<String,String> body});
  Future<Either<Failure,Success>> fetchSlotHistory({required String url,Map<String,String> header,Map<String,dynamic>? body});
}
class BookRepository implements BaseBookRepo{

  @override
  Future<Either<Failure, Success>> bookAppointment({required String url,required Map<String, String> header, required Map<String, String> body}) async{
    // TODO: implement bookAppoint
    try{
      final req=MultipartRequest("POST",Uri.parse(url));
      req.headers.addAll(header);
      if(body['photo']!=null){
        req.files.add(await MultipartFile.fromPath('photo', body['photo'].toString(),contentType: MediaType("image",'jpg/png')));
      }
      req.fields.addAll(body);
      final response=await req.send();
      Response resp=await Response.fromStream(response);
      final result=await jsonDecode(resp.body);
      log("Booking Response=>${resp.body}");
      switch(resp.statusCode){
        case 200:
          return Right(Success(status: BookStatus.completed,msg: "${result['msg']}"));
        case 400 || 404:
          return Left(Failure(status: BookStatus.error,msg:"${result['msg']}"));
        default:
          return Left(Failure(status: BookStatus.error,msg:"${result['msg']}"));
      }
    }
    on FormatException catch(e){
      log("Format Exception=>$e");
      return Left(Failure(status: BookStatus.error,msg:"Format Exception"));
    }
    on SocketException catch(e){
      log("Socket Exception=>$e");
      return Left(Failure(status: BookStatus.error,msg:"Socket Exception"));
    }
    on CertificateException catch(e){
      log("Certificate Exception=>$e");
      return Left(Failure(status: BookStatus.error,msg:"Certificate Exception"));
    }
    catch(e,stk){
      log("Booking Appoint Error message=>${stk.toString()}");
      return Left(Failure(status: BookStatus.error,msg:"Internal Server Error !!!"));
    }
  }

  @override
  Future<Either<Failure, Success>> fetchSlotHistory({required String url, Map<String,String>? header,Map<String, dynamic>? body}) async{
    // TODO: implement fetchSlotHistory
    try{
      final resp=await post(Uri.parse(url),body: body,headers: header);
      final result=slotHistoryModelFromJson(resp.body);
      log("Slot History=>${resp.body}");
      switch(resp.statusCode){
        case 200:
          if(result.result==null){
            return Left(Failure(status: BookStatus.error,msg: "${result.msg}"));
          }
          else {
            return Right(Success(
                status: BookStatus.completed,
                msg: "${result.msg}",
                result: result.result
            ));
          }
        case 400 || 404:
          return Left(Failure(status: BookStatus.error,msg:"${result.msg}"));
        default:
          return Left(Failure(status: BookStatus.error,msg:"${result.msg}"));
      }
    }
    on FormatException catch(e){
      log("Format Exception=>$e");
      return Left(Failure(status: BookStatus.error,msg:"Format Exception"));
    }
    on SocketException catch(e){
      log("Socket Exception=>$e");
      return Left(Failure(status: BookStatus.error,msg:"Socket Exception"));
    }
    on CertificateException catch(e){
      log("Certificate Exception=>$e");
      return Left(Failure(status: BookStatus.error,msg:"Certificate Exception"));
    }
    catch(e,stk){
      log("Booking Error message=>${stk.toString()}");
      return Left(Failure(status: BookStatus.error,msg:"Internal Server Error !!!"));
    }
  }

}