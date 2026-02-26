import 'package:vehicle_repair_service/Bloc/AuthBloc/AuthBloc.dart';
import 'package:vehicle_repair_service/Bloc/BookBloc/BookBloc.dart';
import 'package:vehicle_repair_service/Bloc/CategoryBloc/CategoryBloc.dart';
import 'package:vehicle_repair_service/Bloc/ForgotPassBloc/ForgotPassBloc.dart';
import 'package:vehicle_repair_service/Bloc/InternetBloc/InternetBloc.dart';
import 'package:vehicle_repair_service/Bloc/LocationBloc/LocationBloc.dart';
import 'package:vehicle_repair_service/Bloc/LocationRouteBloc/LocationRouteBloc.dart';
import 'package:vehicle_repair_service/Bloc/NotificationBloc/NotificationBloc.dart';
import 'package:vehicle_repair_service/Bloc/PhoneAuthBloc/PhoneAuthBloc.dart';
import 'package:vehicle_repair_service/Bloc/ServiceBloc/ServiceBloc.dart';
import 'package:vehicle_repair_service/Bloc/SettingBloc/SettingBloc.dart';
import 'package:vehicle_repair_service/Bloc/ShopBloc/ShopBloc.dart';
import 'package:vehicle_repair_service/Bloc/SubscriptionBloc/SubscriptionBloc.dart';
import 'package:vehicle_repair_service/Bloc/ThemeBloc/ThemeBloc.dart';
import 'package:vehicle_repair_service/Repository/AuthRepository.dart';
import 'package:vehicle_repair_service/Repository/BookRepository.dart';
import 'package:vehicle_repair_service/Repository/CategoryRepository.dart';
import 'package:vehicle_repair_service/Repository/LocationRepository.dart';
import 'package:vehicle_repair_service/Repository/LocationRouteRepo.dart';
import 'package:vehicle_repair_service/Repository/NotificationRepo.dart';
import 'package:vehicle_repair_service/Repository/PhoneAuthRepo.dart';
import 'package:vehicle_repair_service/Repository/SearchShopRepository.dart';
import 'package:vehicle_repair_service/Repository/ServiceRepository.dart';
import 'package:vehicle_repair_service/Repository/SettingRepository.dart';
import 'package:vehicle_repair_service/Repository/SubscriptionRepo.dart';
import 'package:vehicle_repair_service/Routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_repair_service/UI/SplashScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ThemeBloc()..add(LoadThemeEvent())),
        BlocProvider(create: (context) => AuthBloc(AuthRepository())),
        BlocProvider(create: (context) => CategoryBloc(CategoryRepository())),
        BlocProvider(create: (context) => ServiceBloc(ServiceRepository())),
        BlocProvider(create: (context) => SettingBloc(SettingRepository())),
        BlocProvider(create: (context)=>ForgotPassBloc()),
        //BlocProvider(create: (context)=>InternetBloc()),
        BlocProvider(create: (context)=>BookBloc(BookRepository())),
        BlocProvider(create: (context)=>PhoneAuthBloc(PhoneAuthRepo())),
        BlocProvider(create: (context)=>LocationBloc(LocationRepository())..add(FetchLocationEvent())),
        BlocProvider(create: (context)=>ShopBloc(SearchShopRepo())),
        BlocProvider(create: (context)=>LocationRouteBloc(LocationRouteRepo())),
        BlocProvider(create: (context)=>SubscriptionBloc(SubscriptionRepo())),
        BlocProvider(create: (context)=>NotificationBloc(NotificationRepository()))
      ],
      child: BlocBuilder<ThemeBloc,ThemeState>(builder: (context,state){
        return MaterialApp(
          title: AppRoute.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.initialRoute,
          theme: state.themeData,
          onGenerateRoute: AppRoute.generateRoute,
          home: SplashScreen(),
        );
      }),
    );
  }
}
