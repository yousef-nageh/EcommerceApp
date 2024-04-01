import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_state.dart';

import '../../../../core/util/constance.dart';
import '../manager/home_cubit/home_cubit.dart';

class HomeBottomNaveBar extends StatelessWidget {
  const HomeBottomNaveBar({super.key});

  @override
  Widget build(BuildContext context) {

    HomeCubit cubit = HomeCubit.getInstance(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) => BottomNavigationBar(

        onTap: cubit.setCurrentIndex,
        currentIndex: cubit.currentIndex,
        items: List.generate(
            3,
            (index) => BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.hR(), vertical: 0.2.hR()),
                    decoration: BoxDecoration(
                        color: cubit.setBottomNavigationBarColor(index),
                        borderRadius: BorderRadius.circular(kPadding)),
                    child: Icon(cubit.bottomNavigationBarIcons[index],
                        size: 3.5.hR())),
                label: cubit.bottomNavigationBarLabels[index])),
      ),
    );
  }
}
