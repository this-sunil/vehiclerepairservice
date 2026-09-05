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
import 'package:sentry/sentry.dart';
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
    log("Firebase Connected Successfully !!!");
  });

  await FirebaseSetup.instance.init();
  await DioService.init();
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.development, // fallback
  );

  await Sentry.init(
    (options) {
      options.dsn =
          'https://8ee49dd2103f3157b6d1c14ac028bb7a@o4508844157763584.ingest.de.sentry.io/4510814872338512';
    },

    appRunner: () => runApp(
      SensitiveContent(
        sensitivity: ContentSensitivity.autoSensitive,
        child: const MyApp(),
      ),
    ),
  ).then((v) {
    log("Sentry Connected Successfully !!!");
  });
}
