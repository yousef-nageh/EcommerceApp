import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widget/my_button.dart';
import '../../../../app/widget/my_favorites_icon.dart';
import '../../../../core/util/app_style.dart';
import '../../../home/data/models/home_product_model.dart';
import '../../../home/presentation/manager/home_product_cubit/home_product_cubit.dart';
import '../../../home/presentation/manager/home_product_cubit/home_product_state.dart';

class ProductDetailData extends StatelessWidget {
  const ProductDetailData({super.key, required this.model});

  final ProductListData model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 1,
          model.name.toString(),
          style: AppStyle.textStyle20,
        ),
        Text(
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          model.description.toString(),
          style: AppStyle.textStyle14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "price \$${model.price}",
              style: AppStyle.textStyle20,
            ),
            MyFavoritesIcon(
              model: model,
            )
          ],
        ),
        BlocBuilder<HomeProductCubit, HomeProductStates>(
          builder: (context, state) {
            return MyButton(
                onPressed: () {
                  HomeProductCubit.getInstance(context)
                      .addProductToCard(model.id ?? 0);
                },
                text: HomeProductCubit.getInstance(context)
                    .setCarText(model.id ?? 0));
          },
        )
      ],
    );
  }
}
