import '../core/Bloc/AuthBloc/AuthBloc.dart';
import '../core/Bloc/BookBloc/BookBloc.dart';
import '../core/Bloc/CategoryBloc/CategoryBloc.dart';
import '../core/Bloc/ForgotPassBloc/ForgotPassBloc.dart';
import '../core/Bloc/InternetBloc/InternetBloc.dart';
import '../core/Bloc/LocationBloc/LocationBloc.dart';
import '../core/Bloc/LocationRouteBloc/LocationRouteBloc.dart';
import '../core/Bloc/NotificationBloc/NotificationBloc.dart';
import '../core/Bloc/ServiceBloc/ServiceBloc.dart';
import '../core/Bloc/SettingBloc/SettingBloc.dart';
import '../core/Bloc/ShopBloc/ShopBloc.dart';
import '../core/Bloc/SubscriptionBloc/SubscriptionBloc.dart';
import '../core/Bloc/ThemeBloc/ThemeBloc.dart';
import '../domain/Repository/AuthRepository.dart';
import '../domain/Repository/BookRepository.dart';
import '../domain/Repository/CategoryRepository.dart';
import '../domain/Repository/LocationRepository.dart';
import '../domain/Repository/LocationRouteRepo.dart';
import '../domain/Repository/NotificationRepo.dart';
import '../domain/Repository/SearchShopRepository.dart';
import '../domain/Repository/ServiceRepository.dart';
import '../domain/Repository/SettingRepository.dart';
import '../domain/Repository/SubscriptionRepo.dart';
import '../core/Routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layer/SplashScreen.dart';

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
        BlocProvider(create: (context)=>InternetBloc()),
        BlocProvider(create: (context)=>BookBloc(BookRepository())),
        //BlocProvider(create: (context)=>PhoneAuthBloc(PhoneAuthRepo())),
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
