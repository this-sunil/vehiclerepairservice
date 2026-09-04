import 'dart:developer';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseSetup {
  FirebaseSetup._();

  static FirebaseSetup get instance => FirebaseSetup._();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn signIn = GoogleSignIn.instance;
  UserCredential? user;

  Future<void> init() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      provisional: true,
      providesAppNotificationSettings: true,
    );

    await messaging.setAutoInitEnabled(true);
    await messaging.getInitialMessage();
    //String? token=await messaging.getToken();
    //print("Device Token=>$token");
    //await messaging.subscribeToTopic("all");

    FirebaseMessaging.onMessage.listen((message) {
      print(
        "Message=>${message.notification?.title} ${message.notification?.body}",
      );
    });

    OneSignal.initialize('${dotenv.env['ONESIGNAL_APP_ID']}');
    OneSignal.Notifications.requestPermission(true);
    OneSignal.User.pushSubscription.optIn();
  }

  @pragma('vm:entry-point')
  Future<void> handleRemoteMsg(RemoteMessage message) async {
    if (message.notification != null) {}
  }

  Future<UserCredential?> signInGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await signIn.authenticate(
        scopeHint: ['email', 'profile'],
      );
      final authClient = signIn.authorizationClient;
      final authorization = await authClient.authorizationForScopes(['email']);

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );

      if (user == null) {
        print("message=>No User Found");
      }
      user = await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print("message=>${e.message}");
    } catch (e) {
      print("message=>$e");
    }
    return user;
  }

  static Future<void> sendNotification(RemoteMessage message) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          "Basic_Channel",
          "Basic Channel Notification",
          icon: "@mipmap/ic_launcher",
          visibility: .public,
        );

    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestSoundPermission: true,
        );

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(presentSound: true);

    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: darwinInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    int id = Random().nextInt(10000000);
    flutterLocalNotificationsPlugin.show(
      notificationDetails: notificationDetails,
      id: id,
      title: message.notification?.title,
      body: message.notification?.body,
    );
  }
}
