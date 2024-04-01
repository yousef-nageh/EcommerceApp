import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/feature/profile/presentation/manager/logout_cubit/logout_cubit.dart';

import '../../../../core/util/app_color.dart';
import '../../../../core/util/constance.dart';
import '../manager/logout_cubit/logout_state.dart';


class ProfileMainContainer extends StatelessWidget {
  const ProfileMainContainer({super.key});



  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LogoutCubit, LogoutStates>(
      builder: (context, state) {
        LogoutCubit cubit =LogoutCubit.instance(context);
        return Column(
          children: List.generate(
            5,
                (index) =>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.hR()),
                  child: Container(
                    width: double.infinity,
                    height:8.hR(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kPadding),
                      color: AppColor.test,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPadding),
                      child: Row(
                        children: [
                          Icon(
                           cubit. profileIcon[index],
                            size: 2.35.hR()
                          ),
                          const SizedBox(
                            width: kPadding,
                          ),
                          Text(
                           cubit. profileNames[index],
                            style: AppStyle.textStyle14,
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                cubit. iconMethod(index, context);

                                },
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 2.35.hR(),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}
