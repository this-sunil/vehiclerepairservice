import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_repair_service/UI/Menu/AboutScreen.dart';
import 'package:vehicle_repair_service/UI/Menu/EmergencyScreen.dart';
import 'package:vehicle_repair_service/UI/Menu/HistoryView.dart';
import 'package:vehicle_repair_service/UI/Menu/LanguageScreen.dart';
import 'package:vehicle_repair_service/UI/Menu/PrivacyScreen.dart';
import 'package:vehicle_repair_service/UI/Menu/TermsScreen.dart';
import 'package:vehicle_repair_service/UI/OverViewScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/ChatAdmin.dart';
import 'package:vehicle_repair_service/UI/Screen/DashboardScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/ForgotPassScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/NotificationScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/SignInScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/SignUpScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/TrackerScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/UpdateProfileScreen.dart';
import 'package:vehicle_repair_service/UI/Screen/VerifyOtpScreen.dart';
import 'package:vehicle_repair_service/UI/category/VehicleCategory.dart';
import 'package:vehicle_repair_service/UI/category/BookingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_repair_service/UI/feature/ServicePage.dart';
import '../UI/Screen/SettingScreen.dart';
import '../UI/feature/GeneratePdfScreen.dart';

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

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark(useMaterial3: true).textTheme,
    ).apply(bodyColor: Colors.black, displayColor: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.black,

      elevation: 0,
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    cardTheme: CardThemeData(color: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark(useMaterial3: true).textTheme,
    ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    cardTheme: CardThemeData(color: Color(0xFF1E1E1E)),
  );

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
      // case subscription:
      //   return PageRouteBuilder(
      //     transitionsBuilder: transitionsBuilder,
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         SubscriptionScreen(),
      //   );
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
