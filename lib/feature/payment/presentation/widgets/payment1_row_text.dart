import 'package:flutter/cupertino.dart';

import '../../../../core/util/app_style.dart';


class Payment1RowText extends StatelessWidget {
  final String text1;
  final String text2;
  final bool bigFont;

  const Payment1RowText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.bigFont});

  TextStyle getStyle() {
    if (bigFont) {
      return AppStyle.textStyle20;
    } else {
      return AppStyle.textStyle15;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: getStyle(),
        ),
        Text(
          text2,
          style: getStyle(),
        )
      ],
    );
  }
}
