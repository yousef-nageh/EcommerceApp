
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/util/app_color.dart';

class ShimmerCircleWidget extends StatelessWidget {
  final double radius;

  const ShimmerCircleWidget({super.key,  this.radius=20});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: AppColor.lightGrey,
      highlightColor: AppColor.white,
      child: CircleAvatar(
      radius:radius ,
      ),
    );
  }
}
