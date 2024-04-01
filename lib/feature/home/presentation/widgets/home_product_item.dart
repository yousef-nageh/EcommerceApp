import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/widget/cache_network_image.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_style.dart';
import 'package:shop_app/core/util/constance.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_state.dart';

import '../../../../app/widget/my_favorites_icon.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({super.key, required this.model});

  final ProductListData model;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        context.navigateTo(
            pageName: AppRoutes.productDetailsRoute, arguments: model);
      },
      child: Container(
        height: 35.hR(),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.test,
          borderRadius: BorderRadius.circular(kPadding),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: AppColor.black,
              spreadRadius: 0.2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
                child: Stack(
                  children: [
                    Hero(
                      tag: model.id.toString(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kPadding),
                        child: Container(
                          color: AppColor.white,
                          child: MYCacheNetworkImage(
                            height: double.infinity,
                            imageLink: model.image.toString(),
                            width: double.infinity,
                            boxFit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    if (model.discount != 0)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.hR(), vertical:0.4.hR()),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.yellow),
                          child: Text(
                            "${model.discount}%",
                            style: AppStyle.textStyle14,
                          ),
                        ),
                      ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: MyFavoritesIcon(model: model,)
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      model.name.toString(),
                      style: AppStyle.textStyle15.copyWith(height: 2),
                    ),
                    if (model.discount != 0)
                      Text(model.old_price.toString(),
                          style: AppStyle.textStyle15.copyWith(
                              color: AppColor.grey,
                              decoration: TextDecoration.lineThrough)),
                    if (model.discount == 0)
                      const HeightSizedBox( height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("\$${model.price}", style: AppStyle.textStyle20),
                        BlocBuilder<HomeProductCubit, HomeProductStates>(
                          builder: (context, state) {
                            return InkWell(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              onTap: () {
                                HomeProductCubit.getInstance(context).addProductToCard(model.id??0);
                              },
                              child: Container(
                                width: 10.wR(),
                                height: 10.wR(),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColor.green,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Text(
                                  HomeProductCubit.getInstance(context).setProductText(model.id??0),
                                  style: AppStyle.textStyle14,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
