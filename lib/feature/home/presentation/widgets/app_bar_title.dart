import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/my_icon_button.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_state.dart';

import '../../../../core/util/icon_broken.dart';


class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        const Text(AppString.goodDay),
        const Spacer(),
        MyIconButton(onPressed: () {
          context.navigateTo(pageName: AppRoutes.searchViewRoute);
        }, iconData: IconBroken.Search),
        Stack(
          alignment: Alignment.topRight,
          children: [
            MyIconButton(onPressed: () {
              context.navigateTo(pageName: AppRoutes.addToCardViewRoute);
            }, iconData: IconBroken.Buy),
            BlocBuilder<HomeProductCubit, HomeProductStates>(
              builder: (context, state) {
                return CircleAvatar(
                  radius: 9,
                  backgroundColor: AppColor.yellow,
                  child: FittedBox(child: Text(HomeProductCubit
                      .getInstance(context)
                      .getCardListLength().toString())),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}
