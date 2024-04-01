import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/classes/validator.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/sign_up_cubit/signup_state.dart';

import '../../../../app/widget/hight_sized_box.dart';
import '../../../../app/widget/my_text_form.dart';
import '../../../../core/util/app_string.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {



    return BlocBuilder<SignUpCubit,SignupStates>(builder: (BuildContext context, state) =>

     Form(
      key: SignUpCubit.getInstance(context).formKey ,
      child: Column(
        children: [
           MyTextForm(
            controller:SignUpCubit.getInstance(context).nameText ,
            validator: AppValidator.userNameValidator,
            hintText: AppString.nameHintText,
            labelText: AppString.nameLabelText,
            prefixIcon: Icons.person,
            keyboardType: TextInputType.name,
          ),
          const HeightSizedBox( height: 3,),
           MyTextForm(
            controller:SignUpCubit.getInstance(context).emailText ,
            validator: AppValidator.emailValidator,
            hintText: AppString.emailHintText,
            labelText: AppString.emailLabelText,
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const HeightSizedBox( height: 3,),
           MyTextForm(
            controller:SignUpCubit.getInstance(context).phoneText ,
            validator: AppValidator.phoneNumberValidator,
            hintText: AppString.phoneNumberHint,
            labelText: AppString.phoneNumberLabel,
            prefixIcon: Icons.phone,
            keyboardType: TextInputType.phone,

          ),
          const HeightSizedBox( height: 3,),
           MyTextForm(
             controller:SignUpCubit.getInstance(context).passwordText ,
             validator: AppValidator.passwordValidator,
            hidePassword: SignUpCubit.getInstance(context).hidePassword,
            suffixIconOnPressed:SignUpCubit.getInstance(context).setPasswordIcons ,
            hintText: AppString.passwordHintText,
            labelText: AppString.passwordLabelText,
            prefixIcon: Icons.password,
            keyboardType: TextInputType.text,
            suffixIcon: SignUpCubit.getInstance(context).passwordIcon,
          ),
        ],
      ),
    ),


    );
  }
}
