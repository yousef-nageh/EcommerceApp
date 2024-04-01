import 'package:flutter/material.dart';

import '../../../../core/util/app_color.dart';

class ProductDetailsDesign extends StatelessWidget {
  const ProductDetailsDesign({super.key, required this.upperPart, required this.lowerPart});
  final Widget upperPart;
  final Widget lowerPart;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:  Column(
        children: [
          Expanded(
            child:upperPart
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: lowerPart,
            ),
          )
        ],
      ),
    );
  }
}
