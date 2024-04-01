import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/shimmer_rectangle_widget.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../app/widget/hight_sized_box.dart';
import '../../../../core/util/constance.dart';

class SearchProductWaiting extends StatelessWidget {
  const SearchProductWaiting({super.key});

  @override
  Widget build(BuildContext context) {

    return  ListView.separated(
      padding: const EdgeInsets.all( kPadding),
      itemBuilder: (BuildContext context, int index) => SizedBox(
      height: 17.hR(),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ShimmerRectangleWidget(
          height: 17.hR(),
        ),
      ),
    ),
      separatorBuilder: (BuildContext context, int index) =>  const HeightSizedBox( height: 4,),
      itemCount: 5,);
  }
}
