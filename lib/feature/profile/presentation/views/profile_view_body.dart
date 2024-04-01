import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/app/functions/dependency_injection.dart';
import 'package:shop_app/app/widget/waiting_progress.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/feature/profile/data/repositories/profile_repo_impl.dart';
import 'package:shop_app/feature/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:shop_app/feature/profile/presentation/manager/logout_cubit/logout_state.dart';

import '../../../../app/functions/toast_msg.dart';
import '../../../../core/util/constance.dart';
import '../widgets/profile_main_container.dart';
import '../widgets/profile_upper_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(getIt.get<ProfileRepoImpl>()),
      child: BlocListener<LogoutCubit, LogoutStates>(
        listener: (context, state) {
          if (state is LogoutSuccessState ) {
            CacheHelper.removeData(key: token);
            Phoenix.rebirth(context);


          } else if (state is LogoutErrorState) {
            toastMsg(state.mess, AppColor.red);
          }
        },
        child: BlocBuilder<LogoutCubit, LogoutStates>(
          builder: (context, state) {
            if(state is LogoutWaitingState || state is LogoutSuccessState ){
              return const WaitingProgress();
            }
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileUpperImage(),
                    ProfileMainContainer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
