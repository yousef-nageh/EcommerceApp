import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';

import 'package:shop_app/feature/authentication/presentation/widgets/is_user_login.dart';

import 'sign_up_lower_image_and_text.dart';
import 'signup_and_login_lower_images.dart';

class LoginLowerImageAndText extends StatelessWidget {
  const LoginLowerImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return SignupAndLoginLowerImage(
      images: SignUpLowerImageAndText.images,
      child: IsUserLogin(
          isLogin: false,
          goTo: () {
            context.navigateTo(pageName: AppRoutes.signUpRoute);
          }),
    );
  }
}
