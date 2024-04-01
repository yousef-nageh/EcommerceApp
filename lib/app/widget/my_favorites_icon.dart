import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../core/util/app_color.dart';
import '../../feature/home/data/models/home_product_model.dart';
import '../../feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import '../../feature/home/presentation/manager/home_product_cubit/home_product_state.dart';

class MyFavoritesIcon extends StatelessWidget {
  const MyFavoritesIcon({super.key, required this.model});
  final ProductListData model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductCubit, HomeProductStates>(
      builder: (BuildContext context, state) => CircleAvatar(
        radius:5.wR(),
        backgroundColor: AppColor.test,
        child: IconButton(
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(

            foregroundColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () {
            HomeProductCubit.getInstance(context)
                .postChangeFavorites((model.id ?? 0).toInt());
          },
          icon: Center(
              child: Icon(
                HomeProductCubit.getInstance(context)
                    .setIcon((model.id ?? 0).toInt()),
                color: HomeProductCubit.getInstance(context)
                    .setIconColor((model.id ?? 0).toInt()),
                size:5.2.wR(),
              )),
        ),
      ),
    );
  }
}
