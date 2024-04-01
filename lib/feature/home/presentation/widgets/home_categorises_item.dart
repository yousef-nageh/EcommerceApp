import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/cache_network_image.dart';

import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';

import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/feature/home/data/models/home_categorises_model.dart';


class HomeCategorisesItem extends StatelessWidget {
  const HomeCategorisesItem({super.key, required this.model});

  final CategorisesList model;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: 19.wR(),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CircleAvatar(

            radius: 10.wR(),
            backgroundColor: AppColor.white,
            child: MYCacheNetworkImage(
              imageLink: model.image.toString(),
              height:12.wR(),
              width:12.wR(),
              boxFit: BoxFit.fill,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              model.name.toString().split(" ")[0],
              style: AppStyle.textStyle14.copyWith(color: AppColor.white),
            ),
          )
        ],
      ),
    );
  }
}
