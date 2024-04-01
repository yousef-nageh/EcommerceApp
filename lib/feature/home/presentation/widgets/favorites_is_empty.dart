import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/app_image.dart';
import 'package:shop_app/core/util/app_style.dart';

class AddToEmptyList extends StatelessWidget {
  const AddToEmptyList({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {

    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppImage.addFav,width: double.infinity,height: 50.hR(),fit: BoxFit.contain),
        Text(text,style: AppStyle.textStyle20,)
      ],
    );
  }
}
