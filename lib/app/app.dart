
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/routes/app_routes.dart';
import 'package:shop_app/core/config/theme/app_them.dart';
import 'package:shop_app/feature/home/presentation/manager/home_product_cubit/home_product_cubit.dart';

import '../core/util/size_config.dart';
import '../feature/home/data/repositories/home_repo_impl.dart';
import 'functions/dependency_injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (BuildContext context) =>
      HomeProductCubit(getIt.get<HomeRepoImpl>())
        ..getProductData()
        ..getFavoriteData()
        ..getCard(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splashRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
