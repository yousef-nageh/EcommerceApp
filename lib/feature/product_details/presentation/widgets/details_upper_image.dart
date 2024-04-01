import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/cache_network_image.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_color.dart';

import '../../../home/data/models/home_product_model.dart';
import '../manager/product_details_cubit/product_details_cubit.dart';
import '../manager/product_details_cubit/product_details_state.dart';

class DetailsUpperImage extends StatelessWidget {
  const DetailsUpperImage({super.key, required this.model});
  final ProductListData model  ;

  @override
  Widget build(BuildContext context) {
    ProductDetailsCubit cubit =ProductDetailsCubit.getInstance(context);
    double w=context.getWidth();
    return BlocBuilder<ProductDetailsCubit,ProductDetailsStates>(builder: (BuildContext context, state) =>Card(
      color: AppColor.white,
      surfaceTintColor: Colors.transparent,

      margin: EdgeInsets.zero,
      clipBehavior:Clip.antiAlias ,
      child: Hero(
        tag: model.id.toString(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: MYCacheNetworkImage(
            width:80.wR(),
            imageLink: model.images?[cubit.currentIndex]??"",
            boxFit:  BoxFit.contain,

          ),
        ),
      ),
    ),

    );
  }
  List<String>?getList(){
    model.images?.add(model.image.toString());
    List<String>? strlist = model.images?.cast<String>();
    return strlist;
  }
}
