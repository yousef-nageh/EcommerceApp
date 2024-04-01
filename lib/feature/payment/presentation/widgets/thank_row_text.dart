import 'package:flutter/material.dart';

import '../../../../core/util/app_style.dart';


class ThankYouRowText extends StatelessWidget {
  final String text1;
  final String text2;
  const ThankYouRowText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return  Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,style: AppStyle.textStyle15,),
        Text(text2,style: AppStyle.textStyle15.copyWith(fontWeight: FontWeight.w600),)

      ],
    );
  }
}
