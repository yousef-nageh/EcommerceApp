import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../app/widget/cache_network_image.dart';
import '../../../../core/util/app_color.dart';
import '../../../home/data/models/home_add_to_card_model.dart';

class PaymentItemsInsideBox extends StatelessWidget {
  const PaymentItemsInsideBox({super.key, required this.model});
  final AddToCardModel model;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return  SizedBox(
      height: 25.hR(),

      child: AspectRatio(
        aspectRatio: 3/4,
        child: GridView.builder(
            itemCount: model.data?.cart_items?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75),
            itemBuilder: (BuildContext context, int index) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MYCacheNetworkImage(
                    imageLink: model
                        .data?.cart_items?[index].product?.image
                        ?.toString() ??
                        "",
                    boxFit: BoxFit.contain),
              ),
            )),
      ),
    );
  }
}
