import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/sign_up_cubit/signup_state.dart';
import 'package:shop_app/feature/authentication/presentation/widgets/signup_button.dart';

import 'package:shop_app/feature/authentication/presentation/widgets/upper_text.dart';

import '../../../../app/functions/toast_msg.dart';
import '../../../../app/widget/hight_sized_box.dart';

import '../../../../core/util/constance.dart';

import 'sign_up_form.dart';
import 'sign_up_lower_image_and_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocListener<SignUpCubit, SignupStates>(
      listener: (BuildContext context, state) {
        if (state is SignupSuccessState) {
          if (state.model.status == true) {
            toastMsg(state.model.message.toString(), AppColor.green);
            context.popTo();
          } else {
            toastMsg(state.model.message.toString(), AppColor.red);
          }
        } else if (state is SignupErrorState) {
          toastMsg(state.error, AppColor.red);
        }
      },
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UpperText(
                      text1: AppString.registerAccount,
                      text2: AppString.signUpMassage),
                  HeightSizedBox( height: 8,),
                  SignUpForm(),
                  HeightSizedBox( height: 5,),
                  SignupButton(),
                  HeightSizedBox( height: 6,),
                  SignUpLowerImageAndText()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
