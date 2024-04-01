import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/profile/presentation/manager/profile_cubit/profile_cubit.dart';

import '../../../../app/functions/toast_msg.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/constance.dart';
import '../manager/profile_cubit/profile_state.dart';
import 'my_account_form_and_button.dart';

class MyAccountViewBody extends StatelessWidget {
  const MyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: BlocListener<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if(state is UpdateProfileSuccessState){

            if(state.model.status==true){
              toastMsg(state.model.message??"",AppColor.green);
            }else{
              toastMsg(state.model.message??"",AppColor.red);
            }
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            ProfileCubit cubit = ProfileCubit.getInstance(context);

            if (state is !UpdateProfileWaitingState && cubit.profileModelData != null) {
              return const MyAccountFormAndButton();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
