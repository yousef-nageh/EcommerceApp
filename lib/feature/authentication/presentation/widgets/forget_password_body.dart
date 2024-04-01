import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/core/util/constance.dart';

import 'package:shop_app/feature/authentication/presentation/widgets/is_user_login.dart';

import '../../../../app/functions/toast_msg.dart';
import '../../../../app/widget/my_button.dart';
import '../../../../app/widget/my_text_form.dart';

import '../../../../core/util/app_color.dart';
import 'upper_text.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {

    return   SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding:  EdgeInsets.only(right: kPadding,left: kPadding,top: 10.hR(),bottom: 2.hR()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const UpperText(text1:AppString.forgotPassword , text2: AppString.forgotPasswordMassage,),
                  const MyTextForm(
                    hintText: AppString.emailHintText,
                    labelText: AppString.emailLabelText,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  MyButton(onPressed: (){
                    toastMsg(AppString.provideItLater,AppColor.green);
                  }, text: AppString.continuePassword),
                  IsUserLogin(isLogin: true, goTo: (){
                    context.popTo();
                  }),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
