import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/classes/validator.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/login_cubit/login_state.dart';


import '../../../../app/widget/hight_sized_box.dart';
import '../../../../app/widget/my_text_form.dart';
import '../../../../core/util/app_string.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<LoginCubit,LoginStates>(builder: (BuildContext context, state) =>Form(
      key: LoginCubit.getInstance(context).formKey,
      child: Column(
        children: [
           MyTextForm(
            controller: LoginCubit.getInstance(context).emailTest,

        validator: AppValidator.emailValidator,
            hintText: AppString.emailHintText,
            labelText: AppString.emailLabelText,
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const HeightSizedBox(height: 3,),
           MyTextForm(
             controller: LoginCubit.getInstance(context).passwordTest,
            hidePassword: LoginCubit.getInstance(context).hidePassword,
            suffixIconOnPressed: LoginCubit.getInstance(context).setPasswordIcons,
            validator: AppValidator.passwordValidator,
            hintText: AppString.passwordHintText,
            labelText: AppString.passwordLabelText,
            prefixIcon: Icons.password,
            keyboardType: TextInputType.text,
            suffixIcon: LoginCubit.getInstance(context).passwordIcon,
          ),
        ],
      ),
    ),

    );
  }
}
