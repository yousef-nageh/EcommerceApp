import 'package:flutter/material.dart';


import '../../../../core/util/app_string.dart';
import 'payment1_row_text.dart';
import 'payment_driver.dart';
import 'thank_row_text.dart';
import 'thank_you_upper_text.dart';
import 'thank_you_visa_image.dart';

class ThankYouTextWithImage extends StatelessWidget {
  const ThankYouTextWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
   
    return  Column(
      children: [
        Expanded(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const  ThankYouUpperText(),
              SizedBox(height: h*0.02,),


              const ThankYouRowText(
                  text1: "Date", text2: "01/24/2023"),

              const ThankYouRowText(text1: "Time", text2: "10:15 AM"),

              const ThankYouRowText(
                text1: "To",
                text2: "Sam Louis",
              ),
              const PaymentDriver(),
              const Payment1RowText(
                  text1: AppString.total,
                  text2: "\$50.97",
                  bigFont: true),


            const  ThankYouVisaImage(),
              SizedBox(height: h*0.02,),
            ],
          ),
        ),
      ],
    );
  }
}
