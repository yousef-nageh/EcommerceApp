

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../../app/classes/cache_helper.dart';
import '../../../../../core/config/routes/app_routes.dart';
import '../../../../../core/util/app_color.dart';
import '../../../../../core/util/constance.dart';
import '../../data/models/onboarding_model.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitial());
 static OnboardingCubit getInstance(BuildContext context)=>BlocProvider.of(context);
  int currentIndex=0;
  PageController controller=PageController();
  void setCurrentIndex(int index){
    currentIndex=index;
    emit(OnboardingChangeCurrentIndexState());
  }
  void goNext(){
    if(currentIndex<onboardingList.length-1){
      controller.nextPage(duration: const Duration(milliseconds: 1500), curve: Curves.fastEaseInToSlowEaseOut);
    }
  }
  void gotoLogin(BuildContext context){
    if(currentIndex==onboardingList.length-1){

      CacheHelper.setData(key: onBoarding, value: true).then((value) => context.navigateToReplacement(pageName: AppRoutes.loginRoute));

    }
  }
  Color setColor(int index) {
    if (currentIndex == index) {
      return AppColor.green;
    }
    return Colors.transparent;
  }

}
