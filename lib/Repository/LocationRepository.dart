import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vehicle_repair_service/Bloc/LocationBloc/LocationBloc.dart';
import 'package:vehicle_repair_service/Model/Failure.dart';
import 'package:vehicle_repair_service/Model/LocationModel.dart';
import 'package:vehicle_repair_service/Model/Success.dart';

abstract class BaseLocationRepository{
 Future<Either<Failure,Success>> fetchLocation();
}

class LocationRepository extends BaseLocationRepository{

  @override
  Future<Either<Failure, Success>> fetchLocation() async {
    // TODO: implement fetchLocation
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Left(Failure(status: LocationStatus.error,
            msg: 'Location services are disabled.'));
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Left(Failure(status: LocationStatus.error,
              msg: 'Location permissions are denied'));
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Left(Failure(status: LocationStatus.error,
            msg: 'Location permissions are permanently denied, we cannot request permissions.'));
      }
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        timeLimit: Duration(seconds: 2000),
      );
      final position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      final placeMark = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      if (placeMark.isEmpty) {
        return Left(
            Failure(status: LocationStatus.error, msg: 'No Location Found'));
      }
      return Right(Success(status: LocationStatus.completed,
          msg: 'Fetch Location Successfully !!!',
          result: LocationModel(lat: position.latitude,
              long: position.longitude,
              currentAddress: placeMark,
              position: position)));
    }
    on PlatformException catch(e){
      return Left(
          Failure(status: LocationStatus.error, msg: '${e.message}'));
    }
    catch(e){
      return Left(
          Failure(status: LocationStatus.error, msg: 'Something Went Wrong'));
    }
  }

}