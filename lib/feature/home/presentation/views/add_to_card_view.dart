import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_state.dart';
import 'package:shop_app/feature/home/presentation/widgets/add_to_card_view_body.dart';

import '../../../../app/functions/toast_msg.dart';
import '../../../../app/widget/back_icon.dart';
import '../../../../core/util/app_color.dart';
import '../widgets/add_to_card_bottom_nav_bar.dart';

class AddToCardView extends StatelessWidget {
  const AddToCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeProductCubit, HomeProductStates>(
      listener: (context, state) {
        if(state is HomeAddToCardErrorState){
          toastMsg(state.error,AppColor.red);
        }
      },
      child: BlocBuilder<HomeProductCubit, HomeProductStates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                leading: const BackIcon(),
              ),
              body: const AddToCardViewBody(),
              bottomNavigationBar: HomeProductCubit.getInstance(context)
                  .getCardListLength() == 0 && state is HomeAddToCardWaitingState
                  ? null
                  : const AddToCardBottomNavBar()
          );
        },
      ),
    );
  }
}
