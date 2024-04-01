import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/icon_broken.dart';

import 'package:shop_app/feature/home/presentation/views/favorite_view_body.dart';
import 'package:shop_app/feature/profile/presentation/views/profile_view_body.dart';
import 'package:shop_app/feature/home/presentation/widgets/home_view_body.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());


  Color color = Colors.red;
  int currentIndex = 0;

  static HomeCubit getInstance(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const HomeViewBody(),
    const FavoriteViewBody(),
    const ProfileViewBody(),
  ];
  List<IconData> bottomNavigationBarIcons = [
    IconBroken.Home,
    IconBroken.Heart,
    IconBroken.Profile,
  ];

  List<String> bottomNavigationBarLabels = [
    "Home",
    "Favorite",
    "Profile",
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationBarState());
  }

  Color setBottomNavigationBarColor(index) {
    if (currentIndex == index) {
      return AppColor.lightGrey;
    }
    return Colors.transparent;
  }



  Color setAppBarColor() {
    if (currentIndex == 0) {
      return AppColor.green;
    }
    return AppColor.white;
  }

  //*********************************************************************//
Future<bool?> checkInternet() async{
    try {
      var result= await InternetAddress.lookup("google.com");
      if(result.isNotEmpty){
        emit(CheckInternetSuccess());

        return true;
      }
    } on SocketException catch (_) {
      emit(CheckInternetError());

     return false;
    }
    return null;

}

Widget test(){

   if(state is CheckInternetError) {
    return const Text("no in internet");
   }
    return screens[currentIndex];
}




}
