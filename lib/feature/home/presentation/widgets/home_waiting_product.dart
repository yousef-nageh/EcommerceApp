import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/shimmer_rectangle_widget.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../core/util/constance.dart';

class HomeWaitingProduct extends StatelessWidget {
  const HomeWaitingProduct({super.key});

  @override
  Widget build(BuildContext context) {

    return   SliverGrid.builder(


      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.59,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {

        return ClipRRect(
          borderRadius: BorderRadius.circular(kPadding),
          child: ShimmerRectangleWidget(
            height:    3.5.hR(),
          ),
        );
      },
      itemCount: 6,
    );
  }
}
