import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';


class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.onPressed, required this.iconData});
final VoidCallback onPressed;
final IconData iconData;
  @override
  Widget build(BuildContext context) {

    return  IconButton( padding: EdgeInsets.zero,

        onPressed: onPressed, icon: Icon(iconData,size:  4.hR(),));
  }
}
