import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_state.dart';

import '../widgets/app_bar_title.dart';
import '../widgets/home_bottom_nave_bar.dart';
import '../widgets/home_no_internet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    HomeCubit cubit = HomeCubit.getInstance(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {

        if(  state is CheckInternetError){
          return const HomeNoInternet();
        }
        return Scaffold(
        backgroundColor:AppColor.white,
        appBar: AppBar(
          backgroundColor: cubit.setAppBarColor(),
          surfaceTintColor: Colors.transparent,
          title: cubit.currentIndex==0? AppBarTitle():null,
        ),

        bottomNavigationBar:const HomeBottomNaveBar(),
        body: cubit.screens[cubit.currentIndex],
      );
      },
    );
  }

}
