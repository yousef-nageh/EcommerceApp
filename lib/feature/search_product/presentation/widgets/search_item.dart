
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../core/config/routes/app_routes.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_style.dart';
import '../../../../core/util/constance.dart';
import '../../../home/data/models/home_product_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.model});

  final ProductListData model;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        context.navigateTo(pageName: AppRoutes.productDetailsRoute,arguments: model);
      },
      child: Container(
        height: 17.hR(),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
      
          borderRadius: BorderRadius.circular(10),
          color: AppColor.test,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: AppColor.black,
              spreadRadius: 0.2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              child: Hero(
                tag: model.id.toString(),
                child: Container(
                  height:17.hR(),
                  width: 17.hR(),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) ),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            model.image.toString(),
                          ),
                          fit: BoxFit.contain)),
                ),
              ),
            ),
            const SizedBox(
              width: kPadding,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    model.name.toString(),
                    style: AppStyle.textStyle15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(model.price.toString(), style: AppStyle.textStyle14),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
