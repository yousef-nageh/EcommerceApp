import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_state.dart';

import '../../../../app/functions/toast_msg.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/constance.dart';
import '../widgets/favorites_block_builder.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: BlocListener<HomeProductCubit, HomeProductStates>(
        listener: (context, state) {
          if(state is HomeChangeFavoritesErrorState){
            toastMsg(state.error,AppColor.red);
          }
        },
        child: const Column(

          children: [
            Expanded(child: FavoritesBlockBuilder())


          ],
        ),
      ),
    );
  }
}
