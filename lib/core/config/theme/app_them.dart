import 'package:flutter/material.dart';
import 'package:shop_app/core/config/theme/app_bar_theme.dart';
import 'package:shop_app/core/config/theme/text_form_theme.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/constance.dart';

import 'bottom_navigation_bar_theme.dart';
import 'buttons_theme.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.green).copyWith(
      primaryContainer: AppColor.green,
      onPrimaryContainer:AppColor.green,
      primary: AppColor.green,
      surfaceTint: AppColor.white,



    ),

      scaffoldBackgroundColor: AppColor.white,




      splashColor: AppColor.white,
      splashFactory: InkSplash.splashFactory,
      bottomNavigationBarTheme:
          BottomNavigationBarThemes.bottomNavigationBarLightTheme,
      appBarTheme: AppBarThemes.appBarLightTheme,
      elevatedButtonTheme: ButtonsTheme.elevatedButtonLightTheme,
      textButtonTheme: ButtonsTheme.textButtonLightTheme,
      inputDecorationTheme: TextFormTheme.inputDecorationLightTheme,
      filledButtonTheme: ButtonsTheme.filledButtonLightTheme,
      textTheme:
          ThemeData.light().textTheme.apply(fontFamily: poppins).copyWith());

  static ThemeData darkTheme = ThemeData.dark()
      .copyWith(textTheme: ThemeData.dark().textTheme.apply().copyWith());
}
