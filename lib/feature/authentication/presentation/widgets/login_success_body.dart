import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_image.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../../../core/config/routes/app_routes.dart';

class LoginSuccessBody extends StatefulWidget {
  const LoginSuccessBody({super.key});

  @override
  State<LoginSuccessBody> createState() => _LoginSuccessBodyState();
}

class _LoginSuccessBodyState extends State<LoginSuccessBody>with SingleTickerProviderStateMixin {

  late AnimationController animationController;

void setupAnimation(){
  animationController=AnimationController(vsync: this);
  animationController.addStatusListener((status) {

    if(status == AnimationStatus.completed){
      context.navigateToReplacement(pageName: AppRoutes.homeViewRoute);
      animationController.reset();
    }
  });
}
  @override
  void initState() {
    super.initState();
    setupAnimation();
  }
@override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(AppImage.loginSuccess,
        controller: animationController,
          onLoaded: (composition){
            animationController.duration=composition.duration;
          animationController.forward();


          },

        ),
        Text(
          textAlign: TextAlign.center,
          AppString.loginSuccess,

          style: AppStyle.textStyle20,
        )
      ],
    );
  }
}
