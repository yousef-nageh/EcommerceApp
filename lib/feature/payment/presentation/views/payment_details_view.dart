import 'package:flutter/material.dart';
import 'package:shop_app/core/config/extension.dart';

import '../widgets/payment_appbar.dart';
import '../widgets/payment_details_body.dart';


class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:const  PaymentDetailsBody(),
      appBar:PaymentAppbar(onPressed: (){
        context.popTo();
      }, text: "Payment Details") ,
    );
  }
}
