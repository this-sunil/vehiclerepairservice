import 'package:either_dart/either.dart';
import 'package:geocoding/geocoding.dart';

import 'package:vehicle_repair_service/Bloc/LocationRouteBloc/LocationRouteBloc.dart';
import 'package:vehicle_repair_service/Model/Failure.dart';
import 'package:vehicle_repair_service/Model/Success.dart';

abstract class BaseLocationRouteRepo{
  Future<Either<Failure,Success>> fetchRouteInfo({required double lat,required double long});
}
class LocationRouteRepo implements BaseLocationRouteRepo{
  @override
  Future<Either<Failure, Success>> fetchRouteInfo({required double lat,required double long}) async{
    // TODO: implement fetchRouteInfo
    try{
      final placeMark=await placemarkFromCoordinates(lat, long);
      if(placeMark.isEmpty){
        return Left(Failure(status: LocationRouteStatus.error,msg: "Address not found !!!"));
      }
      final p = placeMark.first;
      final address = "${p.name}, ${p.locality}, ${p.administrativeArea}, ${p.country}";
      return Right(Success(status: LocationRouteStatus.completed,msg: 'Address Found !!!',result: address));
    }
    catch(e){
      return Left(Failure(msg: 'No Routes Found !!!',status: LocationRouteStatus.error));
    }
  }
  
}