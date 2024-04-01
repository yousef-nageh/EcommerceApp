import 'package:flutter/material.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../../../core/util/app_color.dart';

class UpperText extends StatelessWidget {
  const UpperText({super.key, required this.text1, required this.text2});
final String text1;
final String text2;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          textAlign:TextAlign.center ,
          text1,style: AppStyle.textStyle20,),
        Text(
            textAlign:TextAlign.center ,
            text2,style: AppStyle.textStyle15.copyWith(color:AppColor.grey)),
      ],
    );
  }
}
