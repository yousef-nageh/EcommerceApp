import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../app/widget/hight_sized_box.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_style.dart';
import '../../data/models/home_add_to_card_model.dart';
import '../manager/home_product_cubit/home_product_cubit.dart';

class AddToCartItem extends StatelessWidget {
  const AddToCartItem({super.key,required this.model});
  final AddToCardDataProduct model;
  @override
  Widget build(BuildContext context) {


    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.test,
      ),
      child: Padding(
        padding: EdgeInsets.all(1.hR()),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: model.image.toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            model.name.toString()),
                        const HeightSizedBox( height: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text("\$${model.price}",
                                    style: AppStyle.textStyle15),
                                const SizedBox(
                                  width: 5,
                                ),
                                if (model.discount != 0)
                                  Text(model.old_price.toString(),
                                      style: AppStyle.textStyle15.copyWith(
                                          color: AppColor.green,
                                          decoration:
                                          TextDecoration.lineThrough)),
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 2.35.hR(),
                              backgroundColor: AppColor.test,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                style: IconButton.styleFrom(
                                  foregroundColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                onPressed: () {
                                  HomeProductCubit.getInstance(context)
                                      .addProductToCard(
                                      (model.id ?? 0).toInt());
                                },
                                icon: Center(
                                    child: Icon(
                                   Icons.delete_forever,
                                      color: AppColor.red,

                                      size: 2.hR(),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (model.discount != 0)
                Positioned(
                  top: 5,
                  left: 5,
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
            ],
          ),
        ),
      ),
    );
  }
}
