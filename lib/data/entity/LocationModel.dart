import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

enum LocationStatus { initial, loading, completed, error }

enum LocationRouteStatus { initial, loading, completed, error }

class LocationModel {
  final double lat;
  final double long;
  final Position position;
  final List<Placemark>? currentAddress;
  LocationModel({
    required this.lat,
    required this.long,
    this.currentAddress,
    required this.position,
  });
}
