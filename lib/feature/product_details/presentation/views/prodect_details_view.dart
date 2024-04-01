import 'package:flutter/material.dart';
import 'package:shop_app/core/util/app_color.dart';

import '../../../home/data/models/home_product_model.dart';
import '../widgets/product_details_app_bar.dart';
import '../widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.model});

  final ProductListData model  ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.test,
        title: const ProductDetailsAppBar(),
      ),
      body: ProductDetailsViewBody(
        model: model,
      ),
      backgroundColor: AppColor.test,
    );
  }
}
