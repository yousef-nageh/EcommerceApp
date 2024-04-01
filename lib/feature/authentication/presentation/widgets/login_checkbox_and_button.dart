import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/core/util/app_style.dart';
import '../../../../app/widget/hight_sized_box.dart';
import '../../../../app/widget/my_button.dart';
import '../../../../app/widget/my_text_button.dart';
import '../../../../core/util/app_color.dart';
import '../cubit/login_cubit/login_cubit.dart';
import '../cubit/login_cubit/login_state.dart';

class LoginCheckboxAndButton extends StatelessWidget {
  const LoginCheckboxAndButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            BlocBuilder<LoginCubit, LoginStates>(
              builder: (BuildContext context, state) => Checkbox(
                activeColor: AppColor.green,
                value: LoginCubit.getInstance(context).checkBox,
                onChanged: (value) {
                  LoginCubit.getInstance(context).setCheckBox(value ?? false);
                },
              ),
            ),
            Text(AppString.rememberMe, style: AppStyle.textStyle14),
            const Spacer(),
            MyTextButton(
                onPressed: () {
                  context.navigateTo(pageName: AppRoutes.forgetPasswordRoute);
                },
                text: AppString.forgotPassword)
          ],
        ),
        const HeightSizedBox(height: 3,),
        BlocBuilder<LoginCubit, LoginStates>(
          builder: (BuildContext context, state) {
            if (state is LoginWaitingState) {
              return CircularProgressIndicator(
                color: AppColor.green,
              );
            }
            return MyButton(
                onPressed: LoginCubit.getInstance(context).loginButtonFunction,
                text: AppString.login);
          },
        )
      ],
    );
  }
}
