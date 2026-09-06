import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_repair_service/core/Services/DioService.dart';
import 'package:vehicle_repair_service/core/Services/FirebaseSetup.dart';
import 'package:vehicle_repair_service/firebase_options.dart';
import 'package:vehicle_repair_service/layer/MyApp.dart';
import 'flavors.dart';
import "package:intl/date_symbol_data_local.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en', '');
  await dotenv.load(fileName: ".env").then((v) => log("message=>Initialize"));
  FlutterError.onError = (details) {
    log("message $details");
    FlutterError.dumpErrorToConsole(details);
  };
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((v) {
    log("Firebase Connected Successfully ${v.options.androidClientId} !!!");
  });

  await FirebaseSetup.instance.init();
  await DioService.init();
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.development, // fallback
  );

  runApp(
    SensitiveContent(
      sensitivity: ContentSensitivity.autoSensitive,
      child: const MyApp(),
    ),
  );
}
