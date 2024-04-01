import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/onboarding/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:shop_app/feature/onboarding/presentation/cubit/onboarding_cubit/onboarding_state.dart';

import '../../../../core/util/app_color.dart';
import '../data/models/onboarding_model.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({super.key });




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingStates>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: List.generate(onboardingList.length, (index) =>
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: OnboardingCubit.getInstance(context).setColor(index),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColor.green)


                ),
              ),),);
      },
    );
  }
}


