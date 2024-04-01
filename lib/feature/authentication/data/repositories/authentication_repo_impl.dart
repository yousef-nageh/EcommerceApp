import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/app/classes/api_endpoint.dart';
import 'package:shop_app/app/classes/api_service.dart';
import 'package:shop_app/app/classes/failure.dart';

import 'package:shop_app/feature/authentication/data/models/signup_model.dart';
import 'package:shop_app/feature/authentication/data/repositories/authentication_repo.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  AuthenticationRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, SignupModel>> postSignupData(
      {required String email,
      required String phone,
      required String password,
      required String name}) async {
    try {
      var response = await apiService.postData(
        endPoint: ApiEndpoint.register,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,

        },
        lang: "ar",
      );
      SignupModel signupModel=SignupModel.fromJson(response.data);


      return Right(signupModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupModel>> postLoginData(
      {required String email, required String password}) async {
    try {
      var response = await apiService.postData(
        endPoint: ApiEndpoint.login,
        data: {
          'email': email,
          'password': password,
        },
        lang: "ar",
      );
      SignupModel signupModel = SignupModel.fromJson(response.data);
      return Right(signupModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
