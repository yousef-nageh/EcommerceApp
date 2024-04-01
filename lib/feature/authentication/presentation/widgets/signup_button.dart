import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widget/my_button.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_string.dart';
import '../cubit/sign_up_cubit/signup_cubit.dart';
import '../cubit/sign_up_cubit/signup_state.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SignUpCubit, SignupStates>(
        builder: (context, state) {
          if (state is SignupWaitingState) {
            return CircularProgressIndicator(
              color: AppColor.green,
            );
          }
          return MyButton(
              onPressed:SignUpCubit.getInstance(context).signupButtonFunction,

              text: AppString.signUp);
        });
  }
}
