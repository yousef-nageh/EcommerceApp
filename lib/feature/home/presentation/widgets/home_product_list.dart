import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';

import 'home_product_item.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProductCubit cubit = HomeProductCubit.getInstance(context);

    return SliverGrid.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100.wR()/80.hR(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return HomeProductItem(
          model: cubit.homeProductCubit!.data!.products![index],
        );
      },
      itemCount: cubit.homeProductCubit?.data?.products?.length ?? 0,
    );
  }
}
