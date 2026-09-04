import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_repair_service/core/Services/FirebaseSetup.dart';
import 'package:vehicle_repair_service/firebase_options.dart';
import 'package:vehicle_repair_service/layer/MyApp.dart';

import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((v) {
    log("Firebase Connected Successfully !!!");
  });
  await FirebaseSetup.instance.init();
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const MyApp());
}
