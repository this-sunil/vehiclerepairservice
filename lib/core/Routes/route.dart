import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../layer/Menu/AboutScreen.dart';
import '../../layer/Menu/EmergencyScreen.dart';
import '../../layer/Menu/HistoryView.dart';
import '../../layer/Menu/LanguageScreen.dart';
import '../../layer/Menu/PrivacyScreen.dart';
import '../../layer/Menu/TermsScreen.dart';
import '../../layer/OverViewScreen.dart';
import '../../layer/Screen/AiAssistantScreen.dart';
import '../../layer/Screen/ChatAdmin.dart';
import '../../layer/Screen/DashboardScreen.dart';
import '../../layer/Screen/ForgotPassScreen.dart';
import '../../layer/Screen/NotificationScreen.dart';
import '../../layer/Screen/TrackerScreen.dart';
import '../../layer/pages/SettingScreen.dart';
import '../../layer/Screen/SignInScreen.dart';
import '../../layer/Screen/SignUpScreen.dart';

import '../../layer/Screen/UpdateProfileScreen.dart';
import '../../layer/category/VehicleCategory.dart';
import '../../layer/category/BookingScreen.dart';
import 'package:flutter/material.dart';

import '../../layer/feature/ServicePage.dart';
import '../../layer/Menu/SubscriptionScreen.dart';

/// Safely reads named route arguments, tolerating a missing or mistyped map.
Map<String, dynamic> _routeArgs(RouteSettings settings) {
  final arguments = settings.arguments;
  if (arguments is Map<String, dynamic>) return arguments;
  if (arguments is Map) return Map<String, dynamic>.from(arguments);
  return const <String, dynamic>{};
}

String _routeString(
  Map<String, dynamic> args,
  String key, [
  String fallback = '',
]) {
  final value = args[key];
  if (value == null) return fallback;
  return value.toString();
}

int _routeInt(Map<String, dynamic> args, String key, [int fallback = 0]) {
  final value = args[key];
  if (value is int) return value;
  return int.tryParse(value?.toString() ?? '') ?? fallback;
}

Widget _invalidRoute(String message) {
  return Scaffold(body: Center(child: Text(message)));
}

class AppRoute {
  AppRoute._();

  AppRoute get instance => AppRoute._();

  //static const String appName = 'Vehicle Repair Service';
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
  static const String aiAssistant = "/ai-assistant";
  static const String player = '/player';

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
        final args = _routeArgs(setting);
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) => HistoryView(
            bookId: _routeInt(args, 'bookId'),
            vehicleName: _routeString(args, 'vehicleName'),
            registrationNo: _routeString(args, 'registrationNo'),
            vehiclePhoto: _routeString(args, 'vehiclePhoto'),
            vehicleType: _routeString(args, 'vehicleType'),
            slotDate: _routeString(args, 'slotDate'),
            slotTime: _routeString(args, 'slotTime'),
            serviceName: _routeString(args, 'serviceName'),
          ),
        );
      case trackerScreen:
        final args = _routeArgs(setting);
        final destination = args['destination'];
        if (destination is! LatLng) {
          return PageRouteBuilder(
            transitionsBuilder: transitionsBuilder,
            pageBuilder: (context, animation, secondaryAnimation) =>
                _invalidRoute('Missing destination for tracker'),
          );
        }
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              TrackerScreen(
                title: _routeString(args, 'title'),
                phone: _routeString(args, 'phone'),
                city: _routeString(args, 'city'),
                shopTime: _routeString(args, 'shopTime'),
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
              ChatAdminScreen(),
        );
      case aiAssistant:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AiAssistantScreen(),
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
      // case generatePdf:
      //   return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         GeneratePdfScreen(),
      //   );
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
        final args = _routeArgs(setting);
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              VehicleCategory(
                serviceId: _routeString(args, 'serviceId'),
                serviceName: _routeString(args, 'serviceName'),
              ),
        );
      case booking:
        final args = _routeArgs(setting);
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BookingScreen(
                type: _routeString(args, 'type'),
                serviceId: _routeString(args, 'serviceId'),
                serviceName: _routeString(args, 'serviceName'),
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
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<void> pushReplace(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  void pop() {
    return Navigator.of(this).pop();
  }
}
