import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/hight_sized_box.dart';
import 'package:shop_app/app/widget/my_button.dart';
import 'package:shop_app/core/config/extension.dart';


import '../manager/payment_cubit/payment_cubit.dart';
import 'custom_credit_card.dart';
import 'payment_details_top_row.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const HeightSizedBox(height: 2),
              SizedBox(
                  width:95.wR(),
                  child: const SelectImage()),
            const HeightSizedBox(height: 4),
              SizedBox(width: 95.wR(), child: const CustomCreditCard()),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width:95.wR(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: MyButton(onPressed: () {
                      PaymentCubit.instance(context).validateForm(context);
                    }, text: "Pay"),
                  ))),
        ),
      ],
    );
  }
}
