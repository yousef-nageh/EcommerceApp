import 'package:flutter/material.dart';
import 'package:shop_app/core/util/constance.dart';
import 'package:shop_app/feature/home/presentation/widgets/add_to_card_block_builder.dart';

class AddToCardViewBody extends StatelessWidget {
  const AddToCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kPadding),
      child: AddToCardBlockBuilder(),
    );
  }
}
