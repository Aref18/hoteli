import 'package:flutter/material.dart';
import 'package:hoteli/core/constants/constans.dart';

class AppThemeLight {
  static ThemeData get LightTheme {
    final BaseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColor.primary,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: AppColor.lightText,
          fontWeight: FontWeight.w400,
        ),
      ),

      //texttheme

      textTheme: const TextTheme(
        //onboarding theme
        displayLarge: TextStyle(
            fontSize: 24,
            color: AppColor.lightText,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            fontSize: 17,
            color: AppColor.lightText,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            fontSize: 16,
            color: AppColor.lightText,
            fontWeight: FontWeight.w400),

        //headlin hotels

        headlineLarge: TextStyle(
            fontSize: 24,
            color: AppColor.lightText,
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
            fontSize: 20,
            color: AppColor.lightText,
            fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(
            fontSize: 16,
            color: AppColor.lightText,
            fontWeight: FontWeight.w400),
      ),

      //elevated buttontheme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      // inputd ecorationtheme

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.lighBorder, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.lighBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: AppColor.DarkFocuesborder, width: 1.5),
        ),
        hintStyle:
            const TextStyle(color: AppColor.lighFocuesborder, fontSize: 14),
        labelStyle: const TextStyle(
            color: AppColor.lightText, fontWeight: FontWeight.bold),
      ),
    );

    return BaseLight.copyWith(
        colorScheme: BaseLight.colorScheme.copyWith(
          outline: Colors.grey[500],
          primaryFixed: AppColor.primary,
          surfaceContainerLow: Colors.grey[300],
        ),
        inputDecorationTheme: BaseLight.inputDecorationTheme
            .copyWith(fillColor: BaseLight.colorScheme.surface));
  }
}

//---------------------------------------------------

class AppThemeDark {
  static ThemeData get DarkTheme {
    final BaseDark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColor.primary,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: AppColor.DarkText,
          fontWeight: FontWeight.w400,
        ),
      ),

      //text theme

      textTheme: const TextTheme(
        //onboarding theme
        displayLarge: TextStyle(
            fontSize: 24,
            color: AppColor.DarkText,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            fontSize: 17,
            color: AppColor.DarkText,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            fontSize: 16,
            color: AppColor.DarkText,
            fontWeight: FontWeight.w400),

        //headlin hotels

        headlineLarge: TextStyle(
            fontSize: 24,
            color: AppColor.DarkText,
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
            fontSize: 20,
            color: AppColor.DarkText,
            fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(
            fontSize: 16,
            color: AppColor.DarkText,
            fontWeight: FontWeight.w400),
      ),

      //elevatedbuttontheme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      // inputdecorationtheme

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.DarkInput,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.lighBorder, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.lighBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: AppColor.DarkFocuesborder, width: 1.5),
        ),
        hintStyle: const TextStyle(color: AppColor.lighInput, fontSize: 14),
        labelStyle: const TextStyle(
            color: AppColor.DarkText, fontWeight: FontWeight.bold),
      ),
    );

    return BaseDark.copyWith(
        colorScheme: BaseDark.colorScheme.copyWith(
          outline: Colors.grey[500],
          primaryFixed: AppColor.primary,
          surfaceContainerLow: Colors.grey[850],
        ),
        inputDecorationTheme: BaseDark.inputDecorationTheme
            .copyWith(fillColor: BaseDark.colorScheme.surface));
  }
}
