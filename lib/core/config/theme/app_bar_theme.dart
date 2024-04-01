import 'package:flutter/material.dart';

import '../../util/app_color.dart';
import '../../util/app_style.dart';
import '../../util/constance.dart';

class AppBarThemes{

  static AppBarTheme appBarLightTheme=AppBarTheme(
    titleSpacing: kPadding,
    backgroundColor: AppColor.white,
    elevation: 0,
    iconTheme: IconThemeData(
        color: AppColor.white,
        size: iconSize,
    ),



    titleTextStyle: AppStyle.textStyle14.copyWith(color: AppColor.white,fontFamily: poppins),
  );
}