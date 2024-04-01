import 'package:flutter/material.dart';

import '../../../../core/util/app_color.dart';



class ThankYouDriver extends StatelessWidget {
  const ThankYouDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          30,
              (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.grey,
              ),
            ),
          )),
    ) ;
  }
}
