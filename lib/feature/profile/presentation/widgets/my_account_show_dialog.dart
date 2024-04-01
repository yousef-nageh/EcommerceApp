import 'package:flutter/material.dart';

import '../../../../app/classes/validator.dart';
import '../../../../app/widget/hight_sized_box.dart';
import '../../../../app/widget/my_text_button.dart';
import '../../../../app/widget/my_text_form.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_string.dart';

Future<void> showWarningDialog({
  required BuildContext context,
  required VoidCallback okPressed,
  required VoidCallback cancelPressed,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required  TextEditingController phoneController,

  required Key key
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button to close dialog
    builder: (BuildContext context) {


      return AlertDialog(
        backgroundColor: AppColor.test,
        actionsAlignment: MainAxisAlignment.spaceAround,
        actionsOverflowButtonSpacing: 20,
        title: const Icon(
          Icons.info_outline_rounded,
        ),
        content: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(height: 10,),
              MyTextForm(
                controller: nameController,
                validator: AppValidator.userNameValidator,
                hintText: AppString.nameHintText,
                labelText: AppString.nameLabelText,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.name,
              ),
              const HeightSizedBox( height: 3,),
              MyTextForm(
                controller: emailController,
                validator: AppValidator.emailValidator,
                hintText: AppString.emailHintText,
                labelText: AppString.emailLabelText,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const HeightSizedBox( height: 3,),
              MyTextForm(
                controller: phoneController,
                validator: AppValidator.phoneNumberValidator,
                hintText: AppString.phoneNumberHint,
                labelText: AppString.phoneNumberLabel,
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          MyTextButton(
            text: AppString.cancel,
            onPressed:cancelPressed,
          ),
          MyTextButton(
            onPressed: okPressed,
            text: AppString.update,
            color: AppColor.red,
          ),
        ],
      );
    },
  );
}
