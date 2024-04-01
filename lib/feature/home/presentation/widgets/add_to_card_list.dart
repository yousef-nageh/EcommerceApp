import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/widgets/add_to_card_item.dart';

import '../manager/home_product_cubit/home_product_cubit.dart';
import '../manager/home_product_cubit/home_product_state.dart';

class AddToCardList extends StatelessWidget {
  const AddToCardList({super.key});

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
            itemCount: cubit.cardModelData?.data?.cart_items?.length ?? 0,
            itemBuilder: (BuildContext context, int index) => AddToCartItem(
                model: cubit.cardModelData!.data!.cart_items![index].product!));
      },
    );
  }
}
