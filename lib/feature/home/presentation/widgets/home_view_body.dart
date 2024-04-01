import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/core/util/constance.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/widgets/product_block_builder.dart';

import '../../../../app/functions/toast_msg.dart';
import '../manager/home_product_cubit/home_product_state.dart';
import 'home_categorises_list.dart';
import 'home_banner_image.dart';
import 'home_product_row_text.dart';
import 'home_view_body_design.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocListener<HomeProductCubit,HomeProductStates>(
      listener: (BuildContext context, state) {
        if(state is HomeChangeFavoritesErrorState){
          toastMsg(state.error,AppColor.red);
        }else if(state is HomeAddToCardErrorState){
          toastMsg(state.error,AppColor.red);
        }
      },
      child: HomeViewDesign(
        homeUpperPart: Stack(

          children: [
            Container(
              height: 40.hR(),
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [
                 AppColor.green,
                 AppColor.white,

               ],
               begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 stops: [0.95,0.05]
               )
             ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding),
                    child: Text(

                      AppString.popularCategorises,
                      style: AppStyle.textStyle20.copyWith(color: AppColor.white),
                    ),
                  ),

                  const HomeCategorisesList(),
                  const HeightSizedBox( height: 10.2,),
                  Expanded(
                    child: Container(

                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        ),


                      ),
                      //
                      //  child: homeLowerImageAndText,

                    ),
                  ),

                ],
              ),
            ),
              Positioned(
              bottom: 0.8.hR(),
                left: 0,
                right: 0,
                child: HomeBannerImage()),
          ],
        ),
        homeLowerImageAndText: const Padding(
          padding: EdgeInsets.only(
            right: kPadding/2,
            left: kPadding/2,


          ),
          child: HomeProductRowText(),
        ),
        homeLowerList: const ProductBlockBuilder(),
      ),
    );
  }
}
