import 'package:flutter/material.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/constance.dart';

import '../../../../app/widget/my_text_button.dart';
import '../../../../core/config/routes/app_routes.dart';
import '../../../../core/util/app_string.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyTextButton(
          onPressed: () {
            CacheHelper.setData(key: onBoarding, value: true).then((value) =>
                context.navigateToReplacement(pageName: AppRoutes.loginRoute));
          },
          text: AppString.skip,
        ),
      ],
    );
  }
}
