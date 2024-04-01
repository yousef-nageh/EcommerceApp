import 'package:dartz/dartz.dart';
import 'package:shop_app/app/classes/failure.dart';
import 'package:shop_app/feature/home/data/models/home_banners_model.dart';
import 'package:shop_app/feature/home/data/models/home_categorises_model.dart';
import 'package:shop_app/feature/home/data/models/home_favorites_model.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';

import '../models/change_card_model.dart';

import '../models/home_add_to_card_model.dart';

abstract class HomeRepo{
 Future<Either<Failure,CategorisesModel>> getCategorisesData();
 Future<Either<Failure,BannersModel>> getBannersData();
 Future<Either<Failure,ProductModel>> getProductData();

 Future<Either<Failure,MessageAndStatusModel>> postFavorites(int itemId);
 Future<Either<Failure,FavoritesModel>> getFavoritesData();
 Future<Either<Failure,MessageAndStatusModel>> addToCard(int id);
 Future<Either<Failure,AddToCardModel>> getCardData();
}