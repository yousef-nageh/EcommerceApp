import 'package:flutter/material.dart';

import '../../../../core/util/app_color.dart';
import 'thank_you_driver.dart';
import 'thank_you_true_icon.dart';

class ThankYouCard extends StatelessWidget {
  final Widget cardData;

  const ThankYouCard({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;

    return Stack(
      clipBehavior: Clip.none,

      alignment: Alignment.topCenter,
      children: [

        Container(

          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(20)),
          child: cardData,
        ),

        const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: ThankYouTrueIcon()),
        Positioned(
          bottom: h * 0.18,
          left: -20,
          child:  CircleAvatar(
            backgroundColor: AppColor.white,
            radius: 20,
          ),
        ),
        Positioned(
          bottom: h * 0.18,
          right: -20,
          child:  CircleAvatar(
            backgroundColor: AppColor.white,
            radius: 20,
          ),
        ),
        Positioned(
          right: 27,
          left: 27,
            bottom: h * 0.18 + 20,
          child:const ThankYouDriver()
        ),

      ],
    );
  }
}
