import 'package:flutter/material.dart';


import '../../../../core/util/app_color.dart';

class ThankYouTrueIcon extends StatelessWidget {
  const ThankYouTrueIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return    CircleAvatar(
      backgroundColor: AppColor.lightGrey,
      radius: 50,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: AppColor.green,
        child: Icon(
          Icons.check,
          color: AppColor.white,
          size: 50,
        ),
      ),
    );
  }
}
