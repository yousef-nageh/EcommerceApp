import 'package:flutter/material.dart';

import '../../util/app_color.dart';
import '../../util/app_style.dart';
import '../../util/constance.dart';

abstract class ButtonsTheme{
  static ElevatedButtonThemeData  elevatedButtonLightTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kButtonRadius)
        ),
        backgroundColor: AppColor.green,
        textStyle:AppStyle.textStyle14,
        foregroundColor:AppColor.white ,
        minimumSize: const Size.fromHeight(kButtonHeight),
    ),
  );
  static TextButtonThemeData  textButtonLightTheme=TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: AppStyle.textStyle15,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColor.green,


    ),
  );
   static FilledButtonThemeData  filledButtonLightTheme=FilledButtonThemeData(
       style: FilledButton.styleFrom(
         shape: const CircleBorder(


         ),
         foregroundColor: AppColor.black,
         backgroundColor: AppColor.grey.withOpacity(0.2),

       )
   );

}