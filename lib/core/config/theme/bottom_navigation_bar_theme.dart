import 'package:flutter/material.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../util/app_color.dart';

class BottomNavigationBarThemes{
 static BottomNavigationBarThemeData bottomNavigationBarLightTheme=BottomNavigationBarThemeData(

   selectedLabelStyle: AppStyle.textStyle14.copyWith(fontSize: 12),
   unselectedLabelStyle:  AppStyle.textStyle14.copyWith(fontSize: 12),
   backgroundColor: AppColor.white,
   elevation: 0,
   selectedItemColor: AppColor.black,
   unselectedItemColor: AppColor.black,
   type: BottomNavigationBarType.fixed,


 );

}