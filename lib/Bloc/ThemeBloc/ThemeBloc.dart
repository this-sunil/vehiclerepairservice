import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_repair_service/Routes/route.dart';
part 'ThemeEvent.dart';
part 'ThemeState.dart';
class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  ThemeBloc():super(ThemeState.initial()){
    on<ToggleThemeEvent>(_toggleTheme);
    on<LoadThemeEvent>(_loadTheme);
  }

  Future<void> _loadTheme(LoadThemeEvent event,Emitter<ThemeState> emit) async{
    final prefs = await SharedPreferences.getInstance();
    final isDark= prefs.getBool('theme');
    emit(
      state.copyWith(
        isDark: isDark,
        themeData:
        isDark==true ? AppRoute.darkTheme : AppRoute.lightTheme,
      ),
    );
  }




  Future<void> _toggleTheme(
      ToggleThemeEvent event,
      Emitter<ThemeState> emit,
      ) async {
      final bool isDark=!state.isDark;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('theme', isDark);
    emit(
      state.copyWith(
        isDark: isDark,
        themeData:
        isDark ? AppRoute.darkTheme : AppRoute.lightTheme,
      ),
    );
  }

}