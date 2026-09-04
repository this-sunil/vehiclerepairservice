// To parse this JSON data, do
//
//     final routeDirectionModel = routeDirectionModelFromJson(jsonString);

import 'dart:convert';

RouteDirectionModel routeDirectionModelFromJson(String str) => RouteDirectionModel.fromJson(json.decode(str));

String routeDirectionModelToJson(RouteDirectionModel data) => json.encode(data.toJson());

class RouteDirectionModel {
  final String? code;
  final List<Route>? routes;
  final List<Waypoint>? waypoints;

  RouteDirectionModel({
    this.code,
    this.routes,
    this.waypoints,
  });

  factory RouteDirectionModel.fromJson(Map<String, dynamic> json) => RouteDirectionModel(
    code: json["code"],
    routes: json["routes"] == null ? [] : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
    waypoints: json["waypoints"] == null ? [] : List<Waypoint>.from(json["waypoints"]!.map((x) => Waypoint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "routes": routes == null ? [] : List<dynamic>.from(routes!.map((x) => x.toJson())),
    "waypoints": waypoints == null ? [] : List<dynamic>.from(waypoints!.map((x) => x.toJson())),
  };
}

class Route {
  final List<Leg>? legs;
  final String? weightName;
  final Geometry? geometry;
  final double? weight;
  final double? duration;
  final double? distance;

  Route({
    this.legs,
    this.weightName,
    this.geometry,
    this.weight,
    this.duration,
    this.distance,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    legs: json["legs"] == null ? [] : List<Leg>.from(json["legs"]!.map((x) => Leg.fromJson(x))),
    weightName: json["weight_name"],
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    weight: json["weight"]?.toDouble(),
    duration: json["duration"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "legs": legs == null ? [] : List<dynamic>.from(legs!.map((x) => x.toJson())),
    "weight_name": weightName,
    "geometry": geometry?.toJson(),
    "weight": weight,
    "duration": duration,
    "distance": distance,
  };
}

class Geometry {
  final List<List<double>>? coordinates;
  final String? type;

  Geometry({
    this.coordinates,
    this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: json["coordinates"] == null ? [] : List<List<double>>.from(json["coordinates"]!.map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "type": type,
  };
}

class Leg {
  final List<dynamic>? steps;
  final double? weight;
  final String? summary;
  final double? duration;
  final double? distance;

  Leg({
    this.steps,
    this.weight,
    this.summary,
    this.duration,
    this.distance,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    steps: json["steps"] == null ? [] : List<dynamic>.from(json["steps"]!.map((x) => x)),
    weight: json["weight"]?.toDouble(),
    summary: json["summary"],
    duration: json["duration"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x)),
    "weight": weight,
    "summary": summary,
    "duration": duration,
    "distance": distance,
  };
}

class Waypoint {
  final String? hint;
  final List<double>? location;
  final String? name;
  final double? distance;

  Waypoint({
    this.hint,
    this.location,
    this.name,
    this.distance,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
    hint: json["hint"],
    location: json["location"] == null ? [] : List<double>.from(json["location"]!.map((x) => x?.toDouble())),
    name: json["name"],
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "hint": hint,
    "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
    "name": name,
    "distance": distance,
  };
}
