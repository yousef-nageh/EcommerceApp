import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app/feature/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:shop_app/feature/home/data/repositories/home_repo_impl.dart';
import 'package:shop_app/feature/profile/data/repositories/profile_repo_impl.dart';


import '../classes/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
  ),);
  getIt.registerSingleton<AuthenticationRepoImpl>(
    AuthenticationRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
   ProfileRepoImpl(getIt.get<ApiService>(),)
  );

}
