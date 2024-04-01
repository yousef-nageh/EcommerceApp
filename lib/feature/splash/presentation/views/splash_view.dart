import 'package:flutter/material.dart';
import 'package:shop_app/core/util/app_color.dart';

import '../widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor: AppColor.green,
      body: const SplashViewBody(),
    );
  }
}
