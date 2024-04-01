import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/app/classes/api_endpoint.dart';

import 'package:shop_app/app/classes/api_service.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/app/classes/failure.dart';
import 'package:shop_app/feature/home/data/models/change_card_model.dart';

import 'package:shop_app/feature/profile/data/models/profile_model.dart';
import 'package:shop_app/feature/profile/data/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    try {
      var response = await apiService.getData(
          endPoint: ApiEndpoint.profile, token: CacheHelper.token);
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      return right(profileModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageAndStatusModel>> logout() async {
    try {
      var response = await apiService.postData(
          endPoint:  ApiEndpoint.logout,
          token: CacheHelper.token,
          data: {"fcm_token": CacheHelper.token});
      MessageAndStatusModel messageAndStatusModel =
          MessageAndStatusModel.fromJson(response.data);
      return Right(messageAndStatusModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageAndStatusModel>> updateProfileData({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      var response = await apiService
          .putData(endPoint:  ApiEndpoint.updateProfile, token: CacheHelper.token, data: {
        "name": name,
        "phone": phone,
        "email": email,
      });
      MessageAndStatusModel model = MessageAndStatusModel.fromJson(response.data);
      return Right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }
  }
}
