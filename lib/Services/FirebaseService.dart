import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseService {
  FirebaseService._();
  static FirebaseService get instance => FirebaseService._();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

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
    //log("Device Token=>$token");
    //await messaging.subscribeToTopic("all");

    FirebaseMessaging.onMessage.listen((message) {
      log(
        "Message=>${message.notification?.title} ${message.notification?.body}",
      );
    });


    OneSignal.initialize('${dotenv.env['ONESIGNAL_APP_ID']}');
    OneSignal.Notifications.requestPermission(true);
    OneSignal.User.pushSubscription.optIn();
  }

  @pragma('vm:entry-point')
  Future<void> handleRemoteMsg(RemoteMessage message) async {
    if (message.notification != null) {

    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn signIn = GoogleSignIn.instance;
  UserCredential? user;
   Future<UserCredential?> signInGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await signIn.authenticate(
        scopeHint: ['email','profile'],
      );
      final authClient = signIn.authorizationClient;
      final authorization = await authClient.authorizationForScopes(['email']);

      final GoogleSignInAuthentication googleAuth =  googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );
      user = await auth.signInWithCredential(credential);
      if(user==null){
        log("message=>No User Found");
      }
    }
    on FirebaseAuthException catch(e){
      log("message=>${e.message}");
    }
    catch(e){
      log("message=>$e");
    }
    return user;
  }
}
