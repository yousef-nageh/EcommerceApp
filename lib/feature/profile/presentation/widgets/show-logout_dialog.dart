
import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../../../app/widget/my_text_button.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_string.dart';

Future<void> showLogoutDialog(
    BuildContext context, VoidCallback onPressed,) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button to close dialog
    builder: (BuildContext context) {

      return AlertDialog(
        backgroundColor:  AppColor.test,

        actionsAlignment: MainAxisAlignment.spaceAround,
        actionsOverflowButtonSpacing: 20,
        title: const Icon(
          Icons.info_outline_rounded,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(textAlign:TextAlign.center ,AppString.logoutText,style: AppStyle.textStyle15)

          ],
        ),
        actions: <Widget>[
          MyTextButton(
            text: AppString.cancel,
            onPressed: () {
              context.popTo(); // Close the dialog
            },
          ),
          MyTextButton(
            onPressed: onPressed,
            text: AppString.logout,
            color: AppColor.red,
          ),
        ],
      );
    },
  );
}
