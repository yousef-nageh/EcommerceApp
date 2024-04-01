import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/widget/my_button.dart';
import '../../../../core/util/app_image.dart';
import '../../../../core/util/app_string.dart';
import '../../../../core/util/app_style.dart';
import 'home_view_body_design.dart';

class HomeNoInternet extends StatelessWidget {
  const HomeNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Lottie.asset(AppImage.noNetwork),
          Text(textAlign: TextAlign.center,AppString.noInternet,style: AppStyle.textStyle20,),
          Padding(
            padding: const EdgeInsets.all(20),

            child: MyButton(onPressed: () async{
              await HomeViewDesign.onRefresh(context);

            }, text: "Try Again"),
          )
        ],
      ),
      ),
    );
  }
}
