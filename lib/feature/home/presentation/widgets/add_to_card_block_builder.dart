import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/feature/home/presentation/widgets/add_to_card_list.dart';

import '../../../../app/widget/waiting_progress.dart';
import '../manager/home_product_cubit/home_product_cubit.dart';
import '../manager/home_product_cubit/home_product_state.dart';
import 'favorites_is_empty.dart';

class AddToCardBlockBuilder extends StatelessWidget {
  const AddToCardBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<HomeProductCubit, HomeProductStates>(
        builder: (context, state) {
          HomeProductCubit cubit = HomeProductCubit.getInstance(context);
          if(state is HomeAddToCardWaitingState){
            return  const WaitingProgress();
          }
          else if (cubit.cardModelData?.data?.cart_items?.isEmpty==false&&cubit.addToCard.isNotEmpty ) {
            return const AddToCardList();

          }

          else if(cubit.cardModelData?.data?.cart_items?.isEmpty==true){
            return const AddToEmptyList(text: AppString.addToCard,);
          }
          else{
            return const WaitingProgress();
          }
        }

    );
  }
}


