

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:shop_app/core/config/extension.dart';


import '../../../../../core/config/routes/app_routes.dart';
import '../../../../../core/util/app_color.dart';
import '../../../../../core/util/app_image.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitial());


 static PaymentCubit instance(BuildContext context)=>BlocProvider.of(context);
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool showBackView=false;
  final formKey=GlobalKey<FormState>();
  int currentIndex = 0;
  List<String> names = [
    AppImage.visa,
    AppImage.paypal,
    AppImage.apple,
  ];

  Border setBorder(int index) {
    if (currentIndex == index) {
      return Border.all(width: 1.5, color: AppColor.green);
    } else {
      return Border.all(width: 0.8, color: AppColor.black);
    }
  }
  List<BoxShadow> setBoxShadow(int index) {
    if (currentIndex == index) {
      return [ BoxShadow(
        color: AppColor.green,
        offset: const Offset(0,0),
        blurRadius: 2,
        spreadRadius: 0,

      )];
    } else {
      return [];
    }
  }
  void setCurrentIndex(int index){

    currentIndex=index;
    emit(PaymentChangeCurrentIndexState());
  }
void  onCreditCardModelChange (CreditCardModel onCreditCardModelChange) {
  cardHolderName = onCreditCardModelChange.cardHolderName;
  cardNumber = onCreditCardModelChange.cardNumber;
  cvvCode = onCreditCardModelChange.cvvCode;
  expiryDate = onCreditCardModelChange.expiryDate;
  showBackView = onCreditCardModelChange.isCvvFocused;
  emit(PaymentChangeCardNumbers());

  }
  void validateForm(BuildContext context){
if(formKey.currentState?.validate()==true){
  context.navigateToReplacement( pageName: AppRoutes.thankYouRoute);
}
  }


}
