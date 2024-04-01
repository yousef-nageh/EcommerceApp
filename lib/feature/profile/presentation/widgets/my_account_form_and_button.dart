import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../app/widget/hight_sized_box.dart';
import '../../../../app/widget/my_button.dart';
import '../../../../app/widget/my_text_form.dart';
import '../../../../core/util/app_string.dart';
import '../manager/profile_cubit/profile_cubit.dart';
import '../manager/profile_cubit/profile_state.dart';
import 'my_account_show_dialog.dart';

class MyAccountFormAndButton extends StatelessWidget {
  const MyAccountFormAndButton({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.getInstance(context);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextForm(
              readOnly: true,

              controller: ProfileCubit
                  .getInstance(context)
                  .nameText,
              hintText: AppString.nameHintText,
              labelText: AppString.nameLabelText,
              prefixIcon: Icons.person,
              keyboardType: TextInputType.name,
            ),
            const HeightSizedBox( height: 3,),
            MyTextForm(
              controller: ProfileCubit
                  .getInstance(context)
                  .emailText,
              readOnly: true,
              hintText: AppString.emailHintText,
              labelText: AppString.emailLabelText,
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const HeightSizedBox( height: 3,),
            MyTextForm(
              controller: ProfileCubit
                  .getInstance(context)
                  .phoneText,
              readOnly: true,
              hintText: AppString.phoneNumberHint,
              labelText: AppString.phoneNumberLabel,
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const HeightSizedBox( height: 3,),
            MyButton(
                onPressed: () {
                  showWarningDialog(context: context,
                      okPressed: () {
                        cubit.validForm(context);
                      },
                      cancelPressed: () {
                        cubit.setController(cubit.profileModelData);
                        context.popTo();
                      },
                      emailController: cubit.emailText,
                      nameController: cubit.nameText,
                      phoneController: cubit.phoneText,  key: cubit.formKey,);
                },
                text: AppString.update)
          ],
        );
      },
    );
  }
}
