import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';

import '../../../../app/widget/my_button.dart';
import '../../../../core/util/app_style.dart';
import '../../../../core/util/constance.dart';
import '../manager/home_product_cubit/home_product_cubit.dart';
import '../manager/home_product_cubit/home_product_state.dart';

class AddToCardBottomNavBar extends StatelessWidget {
  const AddToCardBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( kPadding),
      child: Row(

        children: [
          Text("TotalPrice =",style: AppStyle.textStyle15,),
          BlocBuilder<HomeProductCubit, HomeProductStates>(
            builder: (context, state) {
              return Text(
                HomeProductCubit.getInstance(context).getTotalPrice(),style: AppStyle.textStyle20,);
            },
          ),
          const SizedBox(width: kPadding,),
          Expanded(child: MyButton(onPressed: (){
            context.navigateTo(pageName:AppRoutes.paymentRoute,arguments: HomeProductCubit.getInstance(context).cardModelData );
          }, text: "Buy")),
        ],
      ),
    );
  }
}
