import 'package:flutter/cupertino.dart';
import 'package:shop_app/app/widget/my_button.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/core/util/constance.dart';


import '../../../../app/widget/hight_sized_box.dart';
import '../../../../core/config/routes/app_routes.dart';
import '../../../../core/util/app_string.dart';
import '../../../home/data/models/home_add_to_card_model.dart';
import 'payment1_image.dart';
import 'payment1_row_text.dart';

import 'payment_driver.dart';




class Payment1Body extends StatelessWidget {
  const Payment1Body({super.key, required this.model});
  final AddToCardModel model;
  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
       slivers: [
         SliverFillRemaining(
           hasScrollBody: false,
           child:  Column(
             children: [
                Payment1Image(model: model,),
               const HeightSizedBox(height: 3),
                Payment1RowText(text1: AppString.orderSubtotal, text2: '\$${model.data?.sub_total}', bigFont: false,),
               const  Padding(
                 padding:  EdgeInsets.symmetric(vertical: 3),
                 child:  Payment1RowText(text1: AppString.discount, text2: '\$0', bigFont: false,),
               ),
               const Payment1RowText(text1: AppString.shipping, text2: '\$8', bigFont: false,),


               Padding(
                 padding:  EdgeInsets.symmetric(vertical: 2.hR()),
                 child: const PaymentDriver(),
               ),
                 Payment1RowText(text1: "Total", text2: "\$${(model.data?.total??0)+8}", bigFont: true),
               Expanded(child: SizedBox(height: 2.hR(),)),
               MyButton(onPressed: () {

                 context.navigateTo(pageName: AppRoutes.paymentDetailsRoute);
               }, text: 'Complete Payment'),

               const SizedBox(height: kPadding,),

             ],
           ),
         )
       ],
      ),
    );
  }
}
