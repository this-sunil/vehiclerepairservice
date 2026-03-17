import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../layer/Menu/AboutScreen.dart';
import '../../layer/Menu/EmergencyScreen.dart';
import '../../layer/Menu/HistoryView.dart';
import '../../layer/Menu/LanguageScreen.dart';
import '../../layer/Menu/PrivacyScreen.dart';
import '../../layer/Menu/TermsScreen.dart';
import '../../layer/OverViewScreen.dart';
import '../../layer/Screen/ChatAdmin.dart';
import '../../layer/Screen/DashboardScreen.dart';
import '../../layer/Screen/ForgotPassScreen.dart';
import '../../layer/Screen/NotificationScreen.dart';
import '../../layer/Screen/PlayerScreen.dart';
import '../../layer/Screen/SettingScreen.dart';
import '../../layer/Screen/SignInScreen.dart';
import '../../layer/Screen/SignUpScreen.dart';
import '../../layer/Screen/TrackerScreen.dart';
import '../../layer/Screen/UpdateProfileScreen.dart';
import '../../layer/Screen/VerifyOtpScreen.dart';
import '../../layer/category/VehicleCategory.dart';
import '../../layer/category/BookingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layer/feature/GeneratePdfScreen.dart';
import '../../layer/feature/ServicePage.dart';
import '../../layer/Menu/SubscriptionScreen.dart';


class AppRoute {
  AppRoute._();
  AppRoute get instance => AppRoute._();
  static const String appName = 'Vehicle Repair Service';
  static const String initialRoute = '/';
  static const String dashboard = '/dashboard';
  static const String register = '/register';
  static const String login = '/login';
  static const String overView = '/overview';
  static const String emergency = '/emergency';
  static const String appLanguage = '/appLanguage';
  static const String info = '/info';
  static const String subscription = '/subscription';
  static const String notification = '/notification';
  static const String settings = '/settings';
  static const String updateProfile = '/update-profile';
  static const String vehicleCategory = 'vehicle-category';
  static const String booking = '/booking';
  static const String forgotPass = '/forgotPass';
  static const String servicePage = '/service-page';
  static const String trackerScreen = '/tracker';
  static const String privacy = '/privacy';
  static const String terms = '/terms';
  static const String about = '/about';
  static const String historyViews = '/history-views';
  static const String verifyOtp = '/verifyOtp';
  static const String generatePdf = "/generatePdf";
  static const String chatAdmin = "/chatAdmin";
  static const String player='/player';




  static RouteTransitionsBuilder transitionsBuilder =
      (context, Animation<double> animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      };

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case dashboard:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              DashboardScreen(),
        );
      case login:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              SignInScreen(),
        );
      case register:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              SignUpScreen(),
        );
      // case verifyOtp:
      //   final args = setting.arguments as Map<String, dynamic>;
      //   final name = args['name'];
      //   final phone = args['phone'];
      //   final pass = args['pass'];
      //   return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         VerifyOtpScreen(name: name, phone: phone, pass: pass),
      //   );
      // case player:
      //   return PageRouteBuilder(
      //       transitionsBuilder: transitionsBuilder,
      //       pageBuilder: (context,animation,secondaryAnimation)=>PlayerScreen());
      case historyViews:
        final args = setting.arguments as Map<String, dynamic>;
        final int bookId = args['bookId'];
        final String vehicleName = args['vehicleName'];
        final String registrationNo = args['registrationNo'];
        final String vehiclePhoto = args['vehiclePhoto'];
        final String vehicleType = args['vehicleType'];
        final String slotDate = args['slotDate'];
        final String slotTime = args['slotTime'];
        final String serviceName = args['serviceName'];

        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) => HistoryView(
            bookId: bookId,
            vehicleName: vehicleName,
            registrationNo: registrationNo,
            vehiclePhoto: vehiclePhoto,
            vehicleType: vehicleType,
            slotDate: slotDate,
            slotTime: slotTime,
            serviceName: serviceName,
          ),
        );
      case trackerScreen:
        final args = setting.arguments as Map<String, dynamic>;
        final String title = args['title'];
        final String phone = args['phone'];
        final String city = args['city'];
        final String shopTime = args['shopTime'];
        final LatLng destination = args['destination'];
        log("message=>$destination");
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              TrackerScreen(
                title: title,
                phone: phone,
                city: city,
                shopTime: shopTime,
                destination: destination,
              ),
        );
      case overView:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              OverViewScreen(),
        );
      case chatAdmin:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              ChatAdminScreen()
        );
      case servicePage:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              ServicePage(),
        );
      case emergency:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              EmergencyScreen(),
        );
      case generatePdf:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              GeneratePdfScreen(),
        );
      case forgotPass:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              ForgotPassScreen(),
        );
      case privacy:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PrivacyPolicyScreen(),
        );
      case terms:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              TermsConditionsScreen(),
        );
      case about:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              AboutUsScreen(),
        );
      case subscription:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              SubscriptionScreen(),
        );
      case appLanguage:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              LanguageScreen(),
        );

      case notification:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              NotificationScreen(),
        );
      case settings:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              SettingScreen(flag: true),
        );
      case vehicleCategory:
        final args = setting.arguments as Map<String, dynamic>;
        final String serviceId = args['serviceId'];
        final String serviceName = args['serviceName'];
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              VehicleCategory(serviceId: serviceId, serviceName: serviceName),
        );
      case booking:
        final args = setting.arguments as Map<String, dynamic>;
        final String serviceId = args['serviceId'];
        final String serviceName = args['serviceName'];
        final String type = args['type'] ?? '';
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BookingScreen(
                type: type,
                serviceId: serviceId,
                serviceName: serviceName,
              ),
        );
      case updateProfile:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              UpdateProfileScreen(),
        );
      default:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              Scaffold(body: Center(child: Text("No Routes Found !!!...."))),
        );
    }
  }
}

extension NavigationExtension on BuildContext {
  Future<void> push(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<void> pushAndRemoveUntil(String routeName, {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  Future<void> pushReplace(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName);
  }

  void pop() {
    return Navigator.of(this).pop();
  }
}
