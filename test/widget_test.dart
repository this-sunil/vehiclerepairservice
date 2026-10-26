import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test/golden_test.dart';
import 'package:vehicle_repair_service/core/Bloc/AuthBloc/AuthBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/BookBloc/BookBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/CategoryBloc/CategoryBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/ForgotPassBloc/ForgotPassBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/LocationBloc/LocationBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/LocationRouteBloc/LocationRouteBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/NotificationBloc/NotificationBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/ServiceBloc/ServiceBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/SettingBloc/SettingBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/ShopBloc/ShopBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/SubscriptionBloc/SubscriptionBloc.dart';
import 'package:vehicle_repair_service/core/Bloc/ThemeBloc/ThemeBloc.dart';
import 'package:vehicle_repair_service/core/Routes/route.dart';
import 'package:vehicle_repair_service/domain/Repository/AuthRepository.dart';
import 'package:vehicle_repair_service/domain/Repository/BookRepository.dart';
import 'package:vehicle_repair_service/domain/Repository/CategoryRepository.dart';
import 'package:vehicle_repair_service/domain/Repository/LocationRepository.dart';
import 'package:vehicle_repair_service/domain/Repository/LocationRouteRepo.dart';
import 'package:vehicle_repair_service/domain/Repository/NotificationRepo.dart';
import 'package:vehicle_repair_service/domain/Repository/SearchShopRepository.dart';
import 'package:vehicle_repair_service/domain/Repository/ServiceRepository.dart';
import 'package:vehicle_repair_service/domain/Repository/SettingRepository.dart';
import 'package:vehicle_repair_service/domain/Repository/SubscriptionRepo.dart';
import 'package:vehicle_repair_service/flavors.dart';
import 'package:vehicle_repair_service/layer/Screen/DashboardScreen.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  FlutterSecureStorage.setMockInitialValues({});
  await dotenv.load(fileName: '.env');
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.development, // fallback
  );

  goldenTest(
    name: 'Sign In Screen Responsive',
    supportMultipleDevices: true,
    supportedDevices: [
      Device.iphone15Pro(),
      Device.pixel9ProXL(),
      Device.ipadPro12(),
      Device.browser(),
    ],
    builder: (_) => TickerMode(
      enabled: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeBloc()..add(LoadThemeEvent())),
          BlocProvider(create: (context) => AuthBloc(AuthRepository())),
          BlocProvider(create: (context) => CategoryBloc(CategoryRepository())),
          BlocProvider(create: (context) => ServiceBloc(ServiceRepository())),
          BlocProvider(create: (context) => SettingBloc(SettingRepository())),
          BlocProvider(create: (context) => ForgotPassBloc()),
          BlocProvider(create: (context) => BookBloc(BookRepository())),
          //BlocProvider(create: (context)=>PhoneAuthBloc(PhoneAuthRepo())),
          BlocProvider(
            create: (context) =>
                LocationBloc(LocationRepository())..add(FetchLocationEvent()),
          ),
          BlocProvider(create: (context) => ShopBloc(SearchShopRepo())),

          BlocProvider(
            create: (context) => LocationRouteBloc(LocationRouteRepo()),
          ),

          BlocProvider(
            create: (context) => SubscriptionBloc(SubscriptionRepo()),
          ),
          BlocProvider(
            create: (context) => NotificationBloc(NotificationRepository()),
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.initialRoute,
          onGenerateRoute: (s) => AppRoute.generateRoute(s),
          home: DashboardScreen(),
        ),
      ),
    ),
  );
}
