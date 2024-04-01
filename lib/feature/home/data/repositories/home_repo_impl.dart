import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/app/classes/api_endpoint.dart';
import 'package:shop_app/app/classes/api_service.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/app/classes/failure.dart';
import 'package:shop_app/feature/home/data/models/change_card_model.dart';
import 'package:shop_app/feature/home/data/models/home_add_to_card_model.dart';
import 'package:shop_app/feature/home/data/models/home_banners_model.dart';
import 'package:shop_app/feature/home/data/models/home_categorises_model.dart';
import 'package:shop_app/feature/home/data/models/home_favorites_model.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';
import 'package:shop_app/feature/home/data/repositories/home_repo.dart';


class HomeRepoImpl implements HomeRepo{

 final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, CategorisesModel>> getCategorisesData() async{
    try {
      var response=await apiService.getData(endPoint: ApiEndpoint.categories,);
      CategorisesModel categorisesModel=CategorisesModel.fromJson(response.data);
      return Right(categorisesModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, BannersModel>> getBannersData()async {
    try {
      var response=await apiService.getData(endPoint: ApiEndpoint.banners,);
      BannersModel bannersModel=BannersModel.fromJson(response.data);
      return Right(bannersModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductData()async {
    try {
      var response=await apiService.getData(endPoint: ApiEndpoint.home,token: CacheHelper.token);
      ProductModel productModel=ProductModel.formJson(response.data);
      return Right(productModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }


  @override
  Future<Either<Failure, MessageAndStatusModel>> postFavorites(int itemId)async {
    try {
      var response=await apiService.postData(endPoint: ApiEndpoint.favorites,token: CacheHelper.token,data: {
        'product_id':itemId,
      },
          lang: "en"
      );
      MessageAndStatusModel changeFavoritesModel=MessageAndStatusModel.fromJson(response.data);
      return Right(changeFavoritesModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }

  }
  @override
  Future<Either<Failure, FavoritesModel>> getFavoritesData() async{
    try {
      var response=await apiService.getData(endPoint: ApiEndpoint.favorites,token: CacheHelper.token,

      );
      FavoritesModel favoritesModel=FavoritesModel.fromJson(response.data);
      return Right(favoritesModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }



  }

  @override
  Future<Either<Failure, MessageAndStatusModel>> addToCard(int id)async {
    try {
      var response=await  apiService.postData(endPoint:ApiEndpoint.carts,token: CacheHelper.token,data: {"product_id":id});
      MessageAndStatusModel cardModel=MessageAndStatusModel.fromJson(response.data);
      return Right(cardModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, AddToCardModel>> getCardData()async {
    try {
      var response=await  apiService.getData(endPoint: ApiEndpoint.carts,token: CacheHelper.token,);

      AddToCardModel addToCardModel=AddToCardModel.fromJson(response.data,);

      return Right(addToCardModel);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }

  }






  }

