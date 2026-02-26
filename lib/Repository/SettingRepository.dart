import 'package:vehicle_repair_service/Bloc/SettingBloc/SettingBloc.dart';
import 'package:vehicle_repair_service/Model/Failure.dart';
import 'package:vehicle_repair_service/Model/SettingModel.dart';
import 'package:vehicle_repair_service/Model/Success.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';

abstract class BaseSettingRepo {
  Future<Either<Failure, Success>> fetchSetting({
    required String url,
    Map<String,String>? header,
    required Map<String,dynamic> body
  });
}

class SettingRepository implements BaseSettingRepo {
  @override
  Future<Either<Failure, Success>> fetchSetting({
    required String url,
    Map<String,String>? header,
    required Map<String,dynamic> body
  }) async {
    // TODO: implement fetch Setting
    try {
      final resp = await post(Uri.parse(url),body: body,headers: header);
      final result =  settingModelFromJson(resp.body);
      switch (resp.statusCode) {
        case 200:
          return Right(Success(status: SettingStatus.completed, msg: result.msg, result: result));
        case 400 || 404:
          return Left(Failure(status: SettingStatus.error, msg: result.msg));
        default:
          return Left(Failure(status: SettingStatus.completed, msg: result.msg));
      }
    } catch (e) {
      return Left(Failure(msg: 'Internal Server Error', status: SettingStatus.error));
    }
  }
}
