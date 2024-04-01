import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_state.dart';
import 'package:shop_app/feature/home/presentation/widgets/favorites_item.dart';


class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeProductCubit, HomeProductStates>(
      builder: (context, state) {
        HomeProductCubit cubit = HomeProductCubit.getInstance(context);
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.4),
          itemCount: cubit.favoritesData?.data?.data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) =>
              FavoritesItem(
                model: cubit.favoritesData!.data!.data![index].product!,

              ),
        );
      },
    );
  }
}
