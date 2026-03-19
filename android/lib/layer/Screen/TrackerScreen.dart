import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/Bloc/LocationBloc/LocationBloc.dart';
import '../../data/Model/RouteDirectionModel.dart';
import '../../core/Routes/route.dart';
import '../../layer/Widget/LoadingIndicator.dart';

class TrackerScreen extends StatefulWidget {
  final String title;
  final String phone;
  final String city;
  final String shopTime;
  final LatLng destination;
  const TrackerScreen({
    super.key,
    required this.destination,
    required this.title,
    required this.phone,
    required this.city,
    required this.shopTime,
  });

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _marker = {};
  final Set<Polyline> _polyline = {};
  String mapStyle = "";
  final Brightness brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  Future<String>? loadMapStyle() async {
    if (kDebugMode) {
      print("Map Style=>${brightness == Brightness.dark}");
    }
    mapStyle = await rootBundle.loadString(
      brightness == Brightness.dark
          ? "assets/style/light.json"
          : "assets/style/dark.json",
    );
    return mapStyle;
  }

  FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String value) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setIosAudioCategory(
      IosTextToSpeechAudioCategory.playback,
      [IosTextToSpeechAudioCategoryOptions.mixWithOthers],
    );
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(value);
  }

  Future<void> stop() async {
    await flutterTts.stop(); // Stop any ongoing speech
  }

  String? distanceInKM;
  bool removed = false;

  // LatLng destination=LatLng(18.30930595975144, 73.97924340563827);

  Future<void> moveCamera(List<LatLng> route) async {
    if (route.isEmpty) return;

    const MarkerId sourceId = MarkerId('source');

    _mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: route.first, bearing: 0, tilt: 45, zoom: 18),
      ),
    );

    for (int i = 0; i < route.length - 1; i++) {
      _marker.removeWhere((m) => m.markerId == sourceId);

      final LatLng current = route[i];
      final LatLng next = route[i + 1];
      final double bearing = Geolocator.bearingBetween(
        current.latitude,
        current.longitude,
        next.latitude,
        next.longitude,
      );
      _marker.add(
        Marker(
          markerId: sourceId,
          flat: true,
          rotation: bearing,
          draggable: true,
          infoWindow: InfoWindow(title: "Source", anchor: Offset(.5, .9)),
          anchor: Offset(.5, .9),
          icon: AssetMapBitmap(
            'assets/icons/driver.png',
            width: 80,
            height: 80,
            imagePixelRatio: 3,
          ),
          position: route[i],
        ),
      );

      await _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: route[i],
            bearing: bearing,
            tilt: 45,
            zoom: 18,
          ),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {});
        }
      });
    }

    if (route.isNotEmpty) {
      speak("Destination Completed");
    }
  }

  Future<void> moveCameraRealDevice(List<LatLng> route) async {
    if (route.isEmpty) return;

    const MarkerId sourceMarkerId = MarkerId('source');

    // Initial camera move
    await _mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: route.first, zoom: 17, tilt: 45, bearing: 0),
      ),
    );

    for (int i = 0; i < route.length - 1; i++) {
      final LatLng current = route[i];
      final LatLng next = route[i + 1];

      final double bearing = Geolocator.bearingBetween(
        current.latitude,
        current.longitude,
        next.latitude,
        next.longitude,
      );

      // Remove only source marker
      _marker.removeWhere((m) => m.markerId == sourceMarkerId);

      _marker.add(
        Marker(
          markerId: sourceMarkerId,
          position: current,
          flat: true,
          rotation: bearing,
          draggable: false,
          anchor: const Offset(0.5, 0.9),
          infoWindow: const InfoWindow(title: "Driver"),
          icon: AssetMapBitmap(
            'assets/icons/driver.png',
            width: 80,
            height: 80,
            imagePixelRatio: 3,
          ),
        ),
      );

      // Smooth camera follow
      await _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: current, zoom: 17, tilt: 45, bearing: bearing),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) setState(() {});
    }

    // Destination reached
    speak("Destination Completed");
  }

  Future<void> callPhone(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: '+91$phoneNumber');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  int distanceInKms(LatLng start, LatLng end) {
    double distance = Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );

    return (distance / 1000).round();
  }

  Future<List<LatLng>> getRoute(LatLng src, LatLng dst) async {
    final url =
        'https://router.project-osrm.org/route/v1/driving/'
        '${src.longitude},${src.latitude};'
        '${dst.longitude},${dst.latitude}'
        '?overview=full&geometries=geojson';
    print("Url=>$url");

    final res = await get(Uri.parse(url));

    final cords = routeDirectionModelFromJson(res.body);
    final routes = cords.routes ?? [];
    final coordinates = routes[0].geometry?.coordinates ?? [];
    return coordinates.map<LatLng>((c) => LatLng(c[1], c[0])).toList();
  }

  List<LatLng> points = [];

  Future<Set<Polyline>> addPolyline(LatLng src, LatLng dst) async {
    points = await getRoute(src, dst);

    _polyline.add(
      Polyline(
        polylineId: const PolylineId('track'),
        geodesic: true,
        jointType: .round,
        zIndex: 1,
        visible: true,
        color: Colors.deepPurpleAccent,
        width: 8,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: points.map((p) => LatLng(p.latitude, p.longitude)).toList(),
      ),
    );
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {});
      }
    });
    return _polyline;
  }

  Future<Set<Marker>> addMarker(CameraPosition initialCameraPosition) async {
    _marker.clear();

    _marker.add(
      Marker(
        markerId: MarkerId('source'),
        flat: true,
        rotation: initialCameraPosition.bearing,
        visible: true,
        zIndexInt: 3,
        draggable: true,
        infoWindow: InfoWindow(title: "Source", anchor: Offset(.5, .9)),
        anchor: const Offset(.5, .9),
        icon: AssetMapBitmap(
          'assets/icons/driver.png',
          width: 80,
          height: 80,
          imagePixelRatio: 3,
        ),
        position: initialCameraPosition.target,
      ),
    );
    _marker.add(
      Marker(
        markerId: MarkerId('dest'),
        flat: true,
        rotation: 0,
        anchor: const Offset(.5, .9),
        icon: AssetMapBitmap(
          'assets/icons/logo.png',
          bitmapScaling: .auto,
          width: 50,
          height: 50,
        ),
        position: widget.destination,
      ),
    );
    return _marker;
  }

  bool flag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMapStyle();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flutterTts.clearVoice();
    flutterTts.stop();
    _marker.clear();
    _polyline.clear();
    points.clear();
    _mapController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                switch (state.status) {
                  case LocationStatus.loading:
                    return LoadingIndicator();
                  case LocationStatus.completed:
                    CameraPosition initialCameraPosition = CameraPosition(
                      target: LatLng(
                        state.model?.lat ?? 0.0,
                        state.model?.long ?? 0.0,
                      ),
                    );

                    return RepaintBoundary(
                      child: GoogleMap(
                        initialCameraPosition: initialCameraPosition,
                        trafficEnabled: true,
                        myLocationButtonEnabled: true,
                        mapType: .normal,
                        zoomGesturesEnabled: true,
                        compassEnabled: true,
                        rotateGesturesEnabled: true,
                        tiltGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        markers: Set.of(_marker),
                        zoomControlsEnabled: true,
                        style: mapStyle,
                        polylines: Set.of(_polyline),
                      
                        onMapCreated: (controller) {
                          _mapController = controller;
                      
                          addMarker(initialCameraPosition);
                      
                          addPolyline(
                            initialCameraPosition.target,
                            widget.destination,
                          );
                      
                          distanceInKM = distanceInKms(
                            initialCameraPosition.target,
                            widget.destination,
                          ).toString();
                          _mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: initialCameraPosition.target,
                                zoom: 18,
                                bearing: initialCameraPosition.bearing,
                                tilt: 45,
                              ),
                            ),
                            duration: Duration(seconds: 1),
                          );
                      
                        },
                      ),
                    );
                  default:
                    return SizedBox.shrink();
                }
              },
            ),
          ),
          if (distanceInKM != null)
            Positioned(
              top: 50,
              left: 10,
              child: Align(
                alignment: .topLeft,
                child: Padding(
                  padding: .all(10),
                  child: CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.keyboard_arrow_left_sharp),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: .bottomCenter,
              child: SizedBox(
                width: .infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: .only(
                      topLeft: .circular(30),
                      topRight: .circular(30),
                    ),
                  ),
                  margin: .zero,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        ListTile(
                          title: Text(
                            '${widget.title} - ${widget.city}',
                            style: TextStyle(fontSize: 18, fontWeight: .bold),
                          ),
                          subtitle: Text(
                            widget.shopTime.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '$distanceInKM KM',
                            style: TextStyle(fontSize: 18, fontWeight: .bold),
                          ),
                        ),
                        // SizedBox(
                        //
                        //   child: BlocBuilder<LocationRouteBloc, LocationRouteState>(
                        //         builder: (context, state) {
                        //           switch (state.status) {
                        //             case LocationRouteStatus.completed:
                        //               final addressList = state.address ?? [];
                        //
                        //               if (addressList.isEmpty) {
                        //                 return Padding(
                        //                   padding: EdgeInsets.all(12),
                        //                   child: TranslateText(
                        //                     'No routes found',
                        //                   ),
                        //                 );
                        //               }
                        //               return ListView.builder(
                        //                 itemCount: addressList.length,
                        //                 padding: .zero,
                        //                 itemBuilder: (context, index) =>
                        //                     ListTile(
                        //                       leading: const Icon(Icons.list),
                        //                       title: Text(addressList[index]),
                        //                     ),
                        //               );
                        //
                        //             case LocationRouteStatus.error:
                        //               return Padding(
                        //                 padding: const EdgeInsets.all(12),
                        //                 child: TranslateText(
                        //                   state.msg ?? 'Something went wrong',
                        //                 ),
                        //               );
                        //
                        //             default:
                        //               return const SizedBox.shrink();
                        //           }
                        //         },
                        //       ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: .infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 25,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: .circular(10),
                                ),
                              ),
                              onPressed: () async {
                                await callPhone(widget.phone);
                              },
                              label: Text(
                                "Contact Service Center",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: .infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.location_on_rounded,
                                color: Colors.black,
                                size: 25,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: .circular(10),
                                ),
                              ),
                              onPressed: () {
                                speak("Start Your Journey");
                                moveCamera(points);

                              },
                              label: Text(
                                "Track Location",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
