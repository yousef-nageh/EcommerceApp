
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_color.dart';

import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  static ProductDetailsCubit getInstance(context) => BlocProvider.of(context);
  int currentIndex=0;
  void setIndex(index){
    currentIndex=index;
    emit(ProductDetailsChangeImageState());
  }
  Color setColor(index){

    if(currentIndex==index){
      return AppColor.green;
    }
    return AppColor.white;
  }
  int getIndex(List<String>? images){
    if((images?.length??0)>=3){
      return 3;
    }

    return images?.length??0;
  }
  List<String> getRandomItems(List<String>? list, int count) {
    if (count > (list?.length??0) ) {
     return list??[];
    }

    List<String> shuffledList = List.from(list??[])..shuffle();

    return shuffledList.sublist(0, count);
  }
}
