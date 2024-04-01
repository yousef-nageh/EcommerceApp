import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/payment/presentation/widgets/payment_items_inside_box.dart';

import '../../../../core/util/app_image.dart';
import '../../../home/data/models/home_add_to_card_model.dart';

class Payment1Image extends StatelessWidget {
  const Payment1Image({super.key, required this.model});

  final AddToCardModel model;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height:54.hR(),
      width: 60.wR(),
      child: Stack(
alignment: Alignment.center,

        children: [
          SvgPicture.asset(
            AppImage.payment1,
            fit: BoxFit.fill,


          ),
          PaymentItemsInsideBox(model:model),
        ],
      ),
    );
  }
}
