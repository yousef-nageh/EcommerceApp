import 'package:flutter/material.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../../../core/util/app_string.dart';

class HomeProductRowText extends StatelessWidget {
  const HomeProductRowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row (

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(AppString.popularProducts,style: AppStyle.textStyle20,),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(AppString.viewAll,style: AppStyle.textStyle15.copyWith(color: AppColor.green),),
            ))
    ],);
  }
}
