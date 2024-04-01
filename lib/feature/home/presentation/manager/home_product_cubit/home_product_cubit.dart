import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util/app_color.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/feature/home/data/models/home_add_to_card_model.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';

import '../../../data/models/home_favorites_model.dart';
import '../../../data/repositories/home_repo.dart';
import 'home_product_state.dart';

class HomeProductCubit extends Cubit<HomeProductStates> {
  HomeProductCubit(this.homeRepo) : super(HomeProductInitial());
  HomeRepo homeRepo;
  FavoritesModel? favoritesData;
  AddToCardModel? cardModelData;

  static HomeProductCubit getInstance(context) => BlocProvider.of(context);

String getTotalPrice(){
  return cardModelData?.data?.total?.roundToDouble().toString()??"";
}
int getCardListLength(){
  return cardModelData?.data?.cart_items?.length??0;
}
  IconData setIcon(int id) {
    if (favorites[id] == true) {
      return Icons.favorite;
    }

    return Icons.favorite_border;
  }
  String setProductText(int id){
    if(addToCard[id]==true){
      return"1";
    }
    return"+";
  }
  String setCarText(int id){
    if(addToCard[id]==true){
      return"Added";
    }
    return AppString.addToCard;
  }
Color setAddToCardColor(int id){
    if(addToCard[id]==true){
      return AppColor.green;
    }
    return AppColor.test;
}
  Color setIconColor(int id) {
    if (favorites[id] == true) {
      return AppColor.red;
    }

    return AppColor.black;
  }

  Map<int?, bool?> favorites = {};
  Map<int?, bool?> addToCard = {};

  ProductModel? homeProductCubit;

  Future<void> getProductData() async {
    emit(HomeGetProductWaitingState());
    var result = await homeRepo.getProductData();
    result.fold((error) => emit(HomeGetProductErrorState(error.errorMessage)),
        (productModel) {
      homeProductCubit = productModel;

      emit(HomeGetProductSuccessState(productModel));
      productModel.data?.products?.forEach((element) {
        favorites.addAll({
          element.id: element.in_favorites,
        });
      });
      productModel.data?.products?.forEach((element) {
        addToCard.addAll({
          element.id: element.in_cart,
        });
      });

    });
  }

  Future<void> postChangeFavorites(int itemId) async {
    favorites[itemId] = !(favorites[itemId] ?? false);
    emit(HomeChangeFavoritesWaitingState());
    var result = await homeRepo.postFavorites(itemId);
    result.fold((error) {
      favorites[itemId] = !(favorites[itemId] ?? false);
      emit(HomeChangeFavoritesErrorState(error.errorMessage));
    }, (changeFavoritesModel) {
      getFavoriteData();
    });
  }

  Future<void> getFavoriteData() async {
    var result = await homeRepo.getFavoritesData();
    result.fold((error) => emit(GetFavoritesErrorState()), (favoritesModel) {
      favoritesData = favoritesModel;
      emit(GetFavoritesSuccessState());
    });
  }
  Future<void> getCard() async{
    var result= await homeRepo.getCardData();
    result.fold((error) => emit(GetCardErrorState()), (cardModel) {
     cardModelData=cardModel;
     emit(GetCardSuccessState());
    });
  }
  Future<void>addProductToCard(int itemId) async{
    addToCard[itemId] = !(addToCard[itemId] ?? false);
    emit(HomeAddToCardWaitingState());
    var result=await homeRepo.addToCard(itemId);
    result.fold((error) {
      addToCard[itemId] = !(addToCard[itemId] ?? false);
      emit(HomeAddToCardErrorState(error.errorMessage));

    }, (cardModel) {
      getCard();

    });
  


  }
}
