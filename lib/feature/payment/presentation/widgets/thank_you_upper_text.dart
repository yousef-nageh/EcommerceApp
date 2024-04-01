import 'package:flutter/material.dart';


import '../../../../core/util/app_string.dart';
import '../../../../core/util/app_style.dart';

class ThankYouUpperText extends StatelessWidget {
  const ThankYouUpperText({super.key});

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Text(
          textAlign:TextAlign.center ,
          AppString.thankYou+" " +AppString.transactionSuccessful,
          style: AppStyle.textStyle20,
        ),

      ],
    );
  }
}
