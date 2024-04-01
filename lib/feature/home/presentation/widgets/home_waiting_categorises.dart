import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/app/widget/shimmer_circle_widget.dart';
import 'package:shop_app/app/widget/shimmer_rectangle_widget.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../core/util/constance.dart';

class HomeWaitingCategorises extends StatelessWidget {
  const HomeWaitingCategorises({super.key});

  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: 15.hR(),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        itemBuilder: (BuildContext context, int index) => SizedBox(
          width:  19.wR(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ShimmerCircleWidget(
              radius: 10.wR()
            ),
              const HeightSizedBox( height: 1,),
              ShimmerRectangleWidget(
               height: 1.hR(),
             )
            ],
          ),
        ),

        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(
          width: kPadding,
        ),
        itemCount: 5,
      ),
    );
  }
}
