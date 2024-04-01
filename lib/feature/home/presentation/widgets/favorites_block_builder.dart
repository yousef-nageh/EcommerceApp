import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_string.dart';

import '../../../../app/widget/waiting_progress.dart';
import '../manager/home_product_cubit/home_product_cubit.dart';
import '../manager/home_product_cubit/home_product_state.dart';
import 'favorites_is_empty.dart';
import 'favorites_list.dart';

class FavoritesBlockBuilder extends StatelessWidget {
  const FavoritesBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<HomeProductCubit, HomeProductStates>(
        builder: (context, state) {
          HomeProductCubit cubit = HomeProductCubit.getInstance(context);
          if(state is HomeChangeFavoritesWaitingState){
            return  const WaitingProgress();
          }
          else if (cubit.favoritesData?.data?.data?.isEmpty==false&&cubit.favorites.isNotEmpty) {
            return const FavoritesList();

          }

          else if(cubit.favoritesData?.data?.data?.isEmpty==true){
            return const AddToEmptyList(text: AppString.addFavorites,);
          }
          else{
            return const WaitingProgress();
          }
        }

    );
  }
}
