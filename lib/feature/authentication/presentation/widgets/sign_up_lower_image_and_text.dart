import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../core/util/app_image.dart';

import 'is_user_login.dart';
import 'signup_and_login_lower_images.dart';

class SignUpLowerImageAndText extends StatelessWidget {
  const SignUpLowerImageAndText({super.key});

  static const List<String> images = [
    AppImage.google,
    AppImage.twitter,
    AppImage.facebook,
  ];

  @override
  Widget build(BuildContext context) {
    return  SignupAndLoginLowerImage(
      images: images,
      child: IsUserLogin(
          isLogin: true,
          goTo: () {
            context.popTo();
          }),
    );
  }
}

