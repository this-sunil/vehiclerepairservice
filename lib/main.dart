import 'dart:developer';
import 'dart:io';
import 'package:vehicle_repair_service/Services/FirebaseService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_repair_service/UI/MyApp.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyHttpOverrides extends HttpOverrides {
  final String certificateAssetPath;

  MyHttpOverrides({required this.certificateAssetPath});

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);

    // Load certificate from assets
    rootBundle.load(certificateAssetPath).then((data) {
      securityContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
    });

    final client = HttpClient(context: securityContext);

    // Reject any untrusted certificate
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => false;

    return client;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('en', '');
  await dotenv.load(fileName: ".env").then((v) => log("message=>Initialize"));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((v) => {log("Firebase Connected Successfully !!!")});

  FirebaseService.instance.init();
  FlutterError.onError = (details) {
    log("message $details");
    FlutterError.dumpErrorToConsole(details);
  };


  await SentryFlutter.init(
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
