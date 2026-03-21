import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../../core/Bloc/AuthBloc/AuthBloc.dart';
import '../../data/Model/AuthModel.dart';
import '../../data/Model/Failure.dart';
import '../../data/Model/Success.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';

abstract class BaseAuthRepository {

  Future<Either<Failure, Success>> login({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  });

  Future<Either<Failure, Success>> register({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, Success>> fetchProfile({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  });

  Future<Either<Failure, Success>> updateProfile({
    required String url,
    required Map<String, String> header,
    required Map<String, String> body,
  });
}

class AuthRepository implements BaseAuthRepository {
  @override
  Future<Either<Failure, Success>> login({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    // TODO: implement login
    try {
      final resp = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: header,
      );
      final result =  authModelFromJson(resp.body);
      switch (resp.statusCode) {
        case 200:
          if(result.status==true){
            return Right(
              Success(status: AuthStatus.login, msg: result.msg, result: result),
            );
          }
          else{
            return Left(
              Failure(status: AuthStatus.error, msg: result.msg),
            );
          }
        case 400:
        case 404:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } catch (e) {
      log("Internal Server Error =>$e");
      return Left(
        Failure(status: AuthStatus.error, msg: "Internal Server Error"),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> register({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    // TODO: implement register
    try {
      final resp = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: header,
      );
      log("Response=>${resp.body}");
      final result =  authModelFromJson(resp.body);

      switch (resp.statusCode) {
        case 200:
          if(result.status==true){
            return Right(
              Success(status: AuthStatus.register, msg: result.msg, result: result),
            );
          }
          else{
            return Left(
              Failure(status: AuthStatus.error, msg: result.msg),
            );
          }
        case 400:
        case 404:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } catch (e,stk) {
      log("Internal Server Error =>${stk.toString()}");
      return Left(
        Failure(status: AuthStatus.error, msg: "Internal Server Error"),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> fetchProfile({
    required String url,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    // TODO: implement register
    try {
      final resp = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: header,
      );
      final result = authModelFromJson(resp.body);
      log("Response=>${resp.body}");
      switch (resp.statusCode) {
        case 200:
          return Right(
            Success(
              status: AuthStatus.fetchProfile,
              msg: result.msg,
              result: result,
            ),
          );
        case 400:
        case 404:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } catch (e) {
      log("Internal Server Error =>$e");
      return Left(
        Failure(status: AuthStatus.error, msg: "Internal Server Error"),
      );
    }
  }

  @override
  Future<Either<Failure, Success>> updateProfile({
    required String url,
    required Map<String, String> header,
    required Map<String, String> body,
  }) async {
    // TODO: implement updateProfile
    try {
      final req = MultipartRequest('POST', Uri.parse(url));
      req.headers.addAll(header);
      log("Header File =>$header");
      req.fields.addAll(body);
      if(body['photo']!=null){
        req.files.add(await MultipartFile.fromPath(
          'photo',
          body['photo'].toString(),
          contentType: MediaType("image", "jpeg/png"),
        ));
      }
      final response = await req.send();
      final resp = await Response.fromStream(response);
      final result = authModelFromJson(resp.body);
      log("Update Response Profile=>${resp.body}");
      switch (resp.statusCode) {
        case 200:
          return Right(
            Success(
              status: AuthStatus.update,
              msg: result.msg,
              result: result,
            ),
          );
        case 400:
        case 404:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: AuthStatus.error, msg: result.msg));
      }
    } on FormatException catch (e) {
      log('Format Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } on SocketException catch (e) {
      log('Socket Exception=>${e.message}');
      return Left(Failure(status: AuthStatus.error, msg: 'Format Exception'));
    } catch (e) {
      log("Internal Server Error =>$e");
      return Left(
        Failure(status: AuthStatus.error, msg: "Internal Server Error !!!"),
      );
    }
  }


}
