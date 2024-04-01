
import 'package:flutter/material.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_style.dart';

import '../../../../app/widget/back_icon.dart';


class PaymentAppbar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback onPressed;
  final String text;
  const PaymentAppbar({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Text(text,style: AppStyle.textStyle20.copyWith(color: AppColor.black),) ,
      leading: const BackIcon(),
    );
}

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(60);
}
