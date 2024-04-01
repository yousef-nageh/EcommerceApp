import 'package:flutter/material.dart';

import '../../../../core/util/app_string.dart';
import '../../../home/data/models/home_add_to_card_model.dart';
import '../widgets/payment1_body.dart';
import '../widgets/payment_appbar.dart';

class Payment1View extends StatelessWidget {
  const Payment1View({super.key,required this.model});
final AddToCardModel model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PaymentAppbar(onPressed: () {

      }, text: AppString.myCart,),
      body:  Payment1Body(model: model,),
    );
  }
}
