import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../core/util/app_color.dart';
import '../../core/util/icon_broken.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key ,this.onPressed});
 final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {

    return IconButton(
        padding: EdgeInsets.zero,
        onPressed:onPressed ?? () {

          context.popTo();
        }, icon: Icon(
      IconBroken.Arrow___Left_2,color: AppColor.black,
      size:2.9.hR() ,
    ));
  }
}
