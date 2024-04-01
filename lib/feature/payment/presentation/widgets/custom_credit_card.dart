import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../core/util/app_color.dart';
import '../manager/payment_cubit/payment_cubit.dart';
import '../manager/payment_cubit/payment_state.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentStates>(
      builder: (context, state) {
        PaymentCubit cubit=PaymentCubit.instance(context);
        return Column(
          children: [
            CreditCardWidget(
                cardType: CardType.visa,
                cardBgColor: AppColor.green,
                padding: 0,
                cardNumber: cubit.cardNumber,
                expiryDate: cubit.expiryDate,
                cardHolderName: cubit.cardHolderName,
                cvvCode: cubit.cvvCode,
                showBackView: cubit.showBackView,
                isHolderNameVisible: true,
                onCreditCardWidgetChange: (value) {}),
            CreditCardForm(

              cardNumber:cubit. cardNumber,
              expiryDate: cubit.expiryDate,
              cardHolderName: cubit.cardHolderName,
              cvvCode: cubit.cvvCode,

              onCreditCardModelChange: cubit.onCreditCardModelChange,
              formKey: cubit.formKey,


            )
          ],
        );
      },
    );
  }
}
