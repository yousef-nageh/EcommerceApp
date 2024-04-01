import 'package:dartz/dartz.dart';

import 'package:shop_app/feature/authentication/data/models/signup_model.dart';

import '../../../../app/classes/failure.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, SignupModel>> postSignupData({
    required String email,
    required String phone,
    required String password,
    required String name,
  });
  Future<Either<Failure, SignupModel>> postLoginData({
    required String email,
    required String password,

  });
}
