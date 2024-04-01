import 'package:flutter/material.dart';

import '../../../../app/widget/back_icon.dart';
import '../widgets/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      leading:  BackIcon(onPressed: (){
        Navigator.of(context).popUntil((route) => route.isFirst);
      },),
        leadingWidth: 70,

      ),
      body:const ThankYouBody(),

    );
  }
}
