import 'package:flutter/material.dart';
import 'thank_you_card.dart';
import 'thank_you_lower_image.dart';
import 'thank_you_text_with_image.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: h * 0.04, top: 0),
        child: ThankYouCard(
          cardData: Padding(
            padding: EdgeInsets.only(right: 22, left: 22, top: 50 + h * 0.02),
            child:const Column(

              children: [
                 Expanded(child: ThankYouTextWithImage()),
                 ThankYouLowerImage(),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
