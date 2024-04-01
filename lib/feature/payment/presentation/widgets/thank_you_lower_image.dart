import 'package:flutter/cupertino.dart';

import '../../../../core/util/app_color.dart';
import '../../../../core/util/app_image.dart';
import '../../../../core/util/app_style.dart';



class ThankYouLowerImage extends StatelessWidget {
  const ThankYouLowerImage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return   SizedBox(
      height: h*0.18+20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: h * 0.09,
                child: AspectRatio(
                    aspectRatio: 1.85,
                    child: Image.asset(
                      AppImage.qrc,
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                height: h * 0.069,
                width: w * 0.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1.5,
                      color: AppColor.green,
                    )),
                child: Text(
                  "PAID",
                  style: AppStyle.textStyle20
                      .copyWith(color: AppColor.green),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
