import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../../../core/util/icon_broken.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            context.popTo();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:1.hR(), vertical:0.4.hR()),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20)),
            child:  Icon(
              IconBroken.Arrow___Left_2,color: AppColor.black,
              size:2.9.hR(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal:1.hR(), vertical:0.4.hR()),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: AppColor.white),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "4.5",
                style: AppStyle.textStyle14.copyWith(color: AppColor.black),
              ),
              Icon(

                Icons.star,
                size:2.9.hR() ,
                color: AppColor.yellow,
              )
            ],
          ),
        ),
      ],
    );
  }
}
