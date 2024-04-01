import 'package:dartz/dartz.dart';
import 'package:shop_app/app/classes/failure.dart';
import 'package:shop_app/feature/profile/data/models/profile_model.dart';

import '../../../home/data/models/change_card_model.dart';

abstract class ProfileRepo{

  Future<Either<Failure,ProfileModel>>getProfileData();
  Future<Either<Failure,MessageAndStatusModel>>updateProfileData({ required String name,required String email,required String phone,});
  Future<Either<Failure,MessageAndStatusModel>>logout();
  
}