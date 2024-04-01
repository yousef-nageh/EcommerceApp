
import 'package:flutter/material.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/core/util/app_style.dart';


import '../../../../app/widget/my_text_button.dart';

class IsUserLogin extends StatelessWidget {
 final VoidCallback goTo;
  final bool isLogin;

  const IsUserLogin({super.key, required this.isLogin, required this.goTo});

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         getText(),
          style: AppStyle.textStyle15.copyWith(color: AppColor.grey),

        ),
        MyTextButton(onPressed: goTo, text: getButtonText())

      ],
    );
  }
  String getText(){
    if(isLogin){
      return AppString.haveAccount;
    }else{
      return AppString.noAccount;
    }
  }
  String getButtonText(){
    if(isLogin){
      return AppString.login;
    }else{
      return AppString.signUp;
    }
  }
}
