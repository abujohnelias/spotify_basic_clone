import 'package:flutter/material.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:figma_squircle/figma_squircle.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color(0xFF3B3B3B),
        fontWeight: FontWeight.w500,
      ),
      filled: true,
      contentPadding: EdgeInsets.all(30),
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 0.4,
        ),
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: 30,
            cornerSmoothing: 1,
          ),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 0.4,
        ),
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: 30,
            cornerSmoothing: 1,
          ),
        ),
      ),
    ),
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        shape: WidgetStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(
                cornerRadius: 25,
                cornerSmoothing: 1,
              ),
            ),
          ),
        ),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color(0xFFA7A7A7),
        fontWeight: FontWeight.w500,
      ),
      filled: true,
      contentPadding: EdgeInsets.all(30),
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 0.4,
        ),
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: 30,
            cornerSmoothing: 1,
          ),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 0.4,
        ),
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(
            cornerRadius: 30,
            cornerSmoothing: 1,
          ),
        ),
      ),
    ),
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: WidgetStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(
                cornerRadius: 25,
                cornerSmoothing: 1,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
