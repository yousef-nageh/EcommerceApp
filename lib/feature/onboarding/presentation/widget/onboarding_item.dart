import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/feature/onboarding/presentation/data/models/onboarding_model.dart';

import '../../../../app/widget/hight_sized_box.dart';
import '../../../../core/util/app_style.dart';
import '../../../../core/util/constance.dart';


class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});
  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          Expanded(child: SvgPicture.asset(model.imagePass,fit: BoxFit.fill,)),
          Text(model.title,style: AppStyle.textStyle20,),
          const HeightSizedBox( height: 3,),
          Text(model.subTitle,style: AppStyle.textStyle15,),
        ],
      ),
    );
  }
}
