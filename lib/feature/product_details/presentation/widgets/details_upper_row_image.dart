import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/cache_network_image.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/feature/product_details/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:shop_app/feature/product_details/presentation/manager/product_details_cubit/product_details_state.dart';

import '../../../home/data/models/home_product_model.dart';

class DetailsUpperRowImages extends StatelessWidget {
  const DetailsUpperRowImages({super.key, required this.model});
  final ProductListData model  ;
  @override
  Widget build(BuildContext context) {


    return BlocBuilder<ProductDetailsCubit,ProductDetailsStates>(builder: (BuildContext context, state) {
      ProductDetailsCubit cubit =BlocProvider.of<ProductDetailsCubit>(context);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(cubit.getIndex(model.images),(index) =>  InkWell(
           overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: (){
            cubit.setIndex(index);

          },
          child: AnimatedContainer(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 7.hR(),
            width: 7.hR(),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1.5,
                  color: cubit.setColor(index),
              ),
            ),
            duration:const  Duration(milliseconds: 350),
            child:MYCacheNetworkImage(
              imageLink:  model.images![index],
              height:4.hR(),
                width: 4.hR(),
              boxFit: BoxFit.contain,

            ),

          ),
        ),)


    );
    },

    );
  }


}
