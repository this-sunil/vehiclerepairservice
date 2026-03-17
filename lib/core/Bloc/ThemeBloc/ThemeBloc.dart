import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/Routes/AppTheme.dart';

part 'ThemeEvent.dart';
part 'ThemeState.dart';
class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  ThemeBloc():super(ThemeState.initial()){
    on<ToggleThemeEvent>(_toggleTheme);
    on<LoadThemeEvent>(_loadTheme);
  }

  Future<void> _loadTheme(LoadThemeEvent event,Emitter<ThemeState> emit) async{
    final storage = FlutterSecureStorage();
    final isDark=await storage.read(key:'theme');
    final darkMode= bool.tryParse(isDark.toString(),caseSensitive: false);
    emit(
      state.copyWith(
        isDark: darkMode,
        themeData:
        darkMode==true ? AppTheme.darkTheme : AppTheme.lightTheme,
      ),
    );
  }




  Future<void> _toggleTheme(
      ToggleThemeEvent event,
      Emitter<ThemeState> emit,
      ) async {
      final bool isDark=!state.isDark;
      final storage =  FlutterSecureStorage();
      await storage.write(key: 'theme', value: isDark.toString());
    emit(
      state.copyWith(
        isDark: isDark,
        themeData:
        isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      ),
    );
  }

}