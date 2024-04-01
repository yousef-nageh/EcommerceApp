

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/core/util/app_color.dart';


class ShimmerRectangleWidget extends StatelessWidget {
  final double width;

  final double height;
  const ShimmerRectangleWidget({super.key,  this.width=double.infinity,  this.height=10, });

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: AppColor.lightGrey,
      highlightColor:  Colors.grey.shade200,
      child: Container(
        color: Colors.black,
        width: width,
        height:height ,

      ),
    );
  }
}
