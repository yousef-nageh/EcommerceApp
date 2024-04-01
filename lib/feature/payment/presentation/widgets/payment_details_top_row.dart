import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:shop_app/feature/payment/presentation/manager/payment_cubit/payment_state.dart';


import '../../../../core/util/app_color.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PaymentCubit, PaymentStates>(
      builder: (context, state) {
        PaymentCubit cubit =PaymentCubit.instance(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              3,
                  (index) =>
                  GestureDetector(
                    onTap:(){
                      cubit.setCurrentIndex(index);
                    },


                    child: SizedBox(
                      width:26.wR() ,
                      child: AspectRatio(
                        aspectRatio:1.8,
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(15),
                            border:cubit. setBorder(index),
                            boxShadow:cubit. setBoxShadow(index),

                          ),
                          duration: const Duration(milliseconds: 350),
                          child: Image.asset(cubit.names[index]),
                        ),
                      ),
                    ),
                  )),
        );
      },
    );
  }
}
