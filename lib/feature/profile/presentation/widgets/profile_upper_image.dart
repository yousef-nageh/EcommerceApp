import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:shop_app/feature/profile/presentation/manager/logout_cubit/logout_state.dart';

import '../../../../app/widget/my_icon_button.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/icon_broken.dart';

class ProfileUpperImage extends StatelessWidget {
  const ProfileUpperImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutStates>(
      builder: (context, state) {
        LogoutCubit cubit = LogoutCubit.instance(context);
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 9.hR(),
              backgroundImage: cubit.getProfileImage(),
            ),
            CircleAvatar(
              radius: 2.35.hR() + 4,
              backgroundColor: AppColor.white,
              child: CircleAvatar(
                radius: 2.35.hR(),
                backgroundColor: AppColor.test,
                child: MyIconButton(
                  onPressed: cubit.setProfileImage,
                  iconData: IconBroken.Edit,
                ),
              ),
            ),
            Positioned(
              top: 9.hR()/2,
              right: -17,
              child: CircleAvatar(
                radius: 2.35.hR() + 4,
                backgroundColor: AppColor.white,
                child: CircleAvatar(
                  radius: 2.35.hR(),
                  backgroundColor: AppColor.test,
                  child: MyIconButton(
                    onPressed: cubit.setCameraImage,
                    iconData: IconBroken.Camera,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
