import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import '../../../../core/util/constance.dart';
import '../../../home/data/models/home_product_model.dart';
import 'details_upper_image.dart';
import 'details_upper_row_image.dart';
import 'product_details_design.dart';
import 'product_details_data.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.model});

  final ProductListData model;

  @override
  Widget build(BuildContext context) {

    return ProductDetailsDesign(
      upperPart: Column(
        children: [
          Expanded(
              child: DetailsUpperImage(
            model: model,
          )),
          const HeightSizedBox( height: 2,),
          DetailsUpperRowImages(
            model: model,
          ),
          const HeightSizedBox( height: 2,),
        ],
      ),
      lowerPart: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: ProductDetailData(
          model: model,
        ),
      ),
    );
  }
}
