import 'package:flutter/material.dart';

import '../../util/app_color.dart';
import '../../util/app_style.dart';
import '../../util/constance.dart';

abstract class TextFormTheme{
  static InputDecorationTheme inputDecorationLightTheme=InputDecorationTheme(

      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIconColor: AppColor.grey,
      prefixIconColor: AppColor.grey,

      labelStyle: AppStyle.textStyle14.copyWith(color: AppColor.black),
      disabledBorder: TextFormTheme.setOutlineInputBorder(color: AppColor.black),
      enabledBorder: TextFormTheme.setOutlineInputBorder(color: AppColor.black),
      focusedBorder:TextFormTheme.setOutlineInputBorder(color: AppColor.black,width: 2),
    errorBorder: TextFormTheme.setOutlineInputBorder(color: AppColor.red,),
    focusedErrorBorder:  TextFormTheme.setOutlineInputBorder(color: AppColor.red,width: 2),

    errorStyle: AppStyle.textStyle15.copyWith(color: AppColor.red),
  );
  static OutlineInputBorder setOutlineInputBorder({ required Color color , double width =1 })=>OutlineInputBorder(

    borderRadius: BorderRadius.circular(kFormRadius),
    borderSide:  BorderSide(
      color:color ,
      width: width,
    ),

  );
}