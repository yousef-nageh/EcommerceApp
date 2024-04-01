import 'package:flutter/material.dart';

import '../../../../app/widget/cache_network_image.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/constance.dart';
import '../../data/models/home_banners_model.dart';

class BannerImageItem extends StatelessWidget {
  const BannerImageItem({super.key, required this.model});
final BannersData? model;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding+10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kPadding),
        child: DecoratedBox(
          position:DecorationPosition.foreground,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPadding),
            border: Border.all(color: AppColor.black, width: 1.5),
          ),
          child: MYCacheNetworkImage(
              imageLink: (model?.image).toString(),
              boxFit:BoxFit.fill,
              width:double.infinity

          ),
        ),
      ),
    );
  }
}
