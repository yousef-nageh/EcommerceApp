import 'package:flutter/material.dart';




import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_image.dart';
import '../../../../core/util/app_style.dart';

class ThankYouVisaImage extends StatelessWidget {
  const ThankYouVisaImage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return     Container(
      height: h * 0.09,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(


          children: [
            Image.asset(
              AppImage.visaLogo,
              width: w * 0.1,
              height: h * 0.025,
            ),
            SizedBox(
              width: w * 0.06,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                 Text(
                  "Credit Card",
                  style: AppStyle.textStyle15
                ),
                Text("Mastercard **78",
                    style: AppStyle.textStyle14
                        .copyWith(color: AppColor.grey))
              ],
            )
          ],
        ),
      ),
    );
  }
}
