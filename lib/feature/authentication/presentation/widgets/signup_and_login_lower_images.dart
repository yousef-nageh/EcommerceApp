import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/core/config/extension.dart';

import '../../../../app/functions/toast_msg.dart';
import '../../../../app/widget/hight_sized_box.dart';
import '../../../../app/widget/my_filled_button.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_string.dart';

class SignupAndLoginLowerImage extends StatelessWidget {
  const SignupAndLoginLowerImage({super.key, required this.images, required this.child});
final List<String> images;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...List.generate(3, (index) =>    Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.wR()),
            child: MyFilledButton(
              onPressed: () {

                toastMsg(AppString.provideItLater,AppColor.green);

              },
              height: 6.hR(),
              width:6.hR() ,
              child: SvgPicture.asset(
                images[index],
                height: 3.hR(),
                width: 3.hR(),
                fit: BoxFit.fill,
              ),
            ),
          ),),

        ],),
        const HeightSizedBox( height: 2,),
        child
      ],
    );
  }
}
