import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  AppTheme._();
  static AppTheme get instance=>AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark(useMaterial3: true).textTheme,
    ).apply(bodyColor: Colors.black, displayColor: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.black,

      elevation: 0,
      iconTheme: IconThemeData(
          color: Colors.white
      ),
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
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    cardTheme: CardThemeData(color: Color(0xFF1E1E1E)),
  );
}