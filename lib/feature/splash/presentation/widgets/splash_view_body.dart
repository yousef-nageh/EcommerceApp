import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';

import 'package:shop_app/core/util/app_image.dart';
import 'package:shop_app/core/util/constance.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {

 late AnimationController controller;
 late Animation<double> animation;
 @override
  void initState() {
   super.initState();
   startAnimation();
   goToOnboarding();

  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  void startAnimation(){
    controller=AnimationController(vsync: this,duration: const Duration(seconds: 2));
    animation=Tween<double>(begin: 0,end: 1).animate(controller);
    controller.forward();

  }
 void goToOnboarding(){
   Future.delayed(const Duration(milliseconds: 2500)).then((value) {

     CacheHelper.onBoarding=  CacheHelper.getData(key: onBoarding);
     CacheHelper.token=  CacheHelper.getData(key: token);
   if(mounted){
     if(CacheHelper.onBoarding!=null) {
       if( CacheHelper.token !=null){
         context.navigateToReplacement(pageName: AppRoutes.homeViewRoute);
       }else{
         context.navigateToReplacement(pageName: AppRoutes.loginRoute);
       }
     }else{
       context.navigateToReplacement(pageName: AppRoutes.onboardingRoute);
     }
   }
 }
   );
 }


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeTransition(opacity: animation,
        child: SvgPicture.asset(AppImage.splash,)),
      ],
    );
  }
}
