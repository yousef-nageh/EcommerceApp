import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/feature/onboarding/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:shop_app/feature/onboarding/presentation/cubit/onboarding_cubit/onboarding_state.dart';

import 'package:shop_app/feature/onboarding/presentation/data/models/onboarding_model.dart';

import '../../../../app/widget/hight_sized_box.dart';
import '../../../../app/widget/my_button.dart';
import 'circle_indicator.dart';
import 'onboarding_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OnboardingCubit, OnboardingStates>(
        builder: (context, state) {
       OnboardingCubit cubit=   OnboardingCubit.getInstance(context);
             return Column(

            children: [


              const HeightSizedBox(height: 7,),
              Expanded(

                child: PageView.builder(

                  controller: cubit.controller,
                  onPageChanged:cubit.setCurrentIndex,


                  itemBuilder: (BuildContext context, int index) =>
                      OnboardingItem(
                        model: onboardingList[index],
                      ),
                  itemCount: onboardingList.length,
                ),
              ),
              const HeightSizedBox(height: 5,),
              const CircleIndicator(),
              const HeightSizedBox(height: 10,),
              SizedBox(
                  width: 146,
                  child: MyButton(onPressed: () {
                   cubit. goNext();
                   cubit. gotoLogin(context);
                  }, text: AppString.next)),
              const HeightSizedBox(height: 10,),


            ],
          );
        },
      ),
    );
  }}
