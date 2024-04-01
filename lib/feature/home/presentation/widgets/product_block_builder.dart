import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home_product_cubit/home_product_cubit.dart';
import '../manager/home_product_cubit/home_product_state.dart';
import 'home_product_list.dart';
import 'home_waiting_product.dart';

class ProductBlockBuilder extends StatelessWidget {
  const ProductBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HomeProductCubit, HomeProductStates>(
        builder: (BuildContext context, state) {
          HomeProductCubit cubit=HomeProductCubit.getInstance(context);
          if (state is !HomeGetProductWaitingState && cubit.homeProductCubit != null) {
            return  const HomeProductList();
          }  else {
            return const HomeWaitingProduct();
          }
        },
      );
}
