import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/app/functions/toast_msg.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/core/util/constance.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/login_cubit/login_state.dart';

import 'package:shop_app/feature/authentication/presentation/widgets/upper_text.dart';

import '../../../../app/widget/hight_sized_box.dart';
import 'login_checkbox_and_button.dart';
import 'login_form.dart';
import 'login_lower_image_and_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginSuccessState) {
          if (state.model.status == true) {
            CacheHelper.setData(key: token, value: state.model.data?.token)
                .then((value) {
              CacheHelper.token=state.model.data?.token.toString();
                   context.navigateToReplacement(
                    pageName: AppRoutes.loginSuccessRoute);
                });
          } else {
            toastMsg(state.model.message.toString(), AppColor.red);
          }
        } else if (state is LoginErrorState) {
          toastMsg(state.error, AppColor.red);
        }
      },
      child: const SafeArea(
        child: Center(
          child: SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.all(kPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UpperText(
                      text1: AppString.welcomeBack,
                      text2: AppString.loginMassage),
                  HeightSizedBox(height: 10,),
                  LoginForm(),
                  HeightSizedBox(height: 3,),
                  LoginCheckboxAndButton(),
                  HeightSizedBox(height: 6,),
                  LoginLowerImageAndText()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
