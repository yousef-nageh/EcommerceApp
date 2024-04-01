import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/app/app.dart';
import 'package:shop_app/core/util/app_string.dart';
import 'package:shop_app/feature/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/cubit/sign_up_cubit/signup_cubit.dart';
import 'package:shop_app/feature/authentication/presentation/views/forgot_password_view.dart';
import 'package:shop_app/feature/authentication/presentation/views/login_success_view.dart';
import 'package:shop_app/feature/authentication/presentation/views/login_view.dart';
import 'package:shop_app/feature/authentication/presentation/views/sign_up_view.dart';
import 'package:shop_app/feature/home/data/models/home_product_model.dart';
import 'package:shop_app/feature/home/data/repositories/home_repo_impl.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/feature/home/presentation/views/add_to_card_view.dart';
import 'package:shop_app/feature/home/presentation/views/home_view.dart';
import 'package:shop_app/feature/onboarding/presentation/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:shop_app/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:shop_app/feature/product_details/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:shop_app/feature/product_details/presentation/views/prodect_details_view.dart';
import 'package:shop_app/feature/profile/data/repositories/profile_repo_impl.dart';
import 'package:shop_app/feature/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:shop_app/feature/profile/presentation/views/my_account_view.dart';
import 'package:shop_app/feature/search_product/presentation/manager/search_product_cubit/search_product_cubit.dart';
import 'package:shop_app/feature/search_product/presentation/views/search_view.dart';

import '../../../app/functions/dependency_injection.dart';
import '../../../feature/home/data/models/home_add_to_card_model.dart';
import '../../../feature/home/presentation/manager/home_banners_cubit/home_banners_cubit.dart';
import '../../../feature/home/presentation/manager/home_categorises_cubit/home_categorises_cubit.dart';
import '../../../feature/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import '../../../feature/payment/presentation/views/payment1_view.dart';
import '../../../feature/payment/presentation/views/payment_details_view.dart';
import '../../../feature/payment/presentation/views/thank_you_view.dart';
import '../../../feature/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "onboardingView";
  static const String loginRoute = "loginView";
  static const String signUpRoute = "signUpView";
  static const String forgetPasswordRoute = "forgetPasswordView";
  static const String loginSuccessRoute = "loginSuccessView";
  static const String homeViewRoute = "homeView";
  static const String productDetailsRoute = " productDetailsView";
  static const String searchViewRoute = " searchView";
  static const String myAccountRoute = " myAccountView";
  static const String addToCardViewRoute = " addToCardView";
  static const String paymentRoute = " paymentView";
  static const String paymentDetailsRoute = "paymentDetails";
  static const String thankYouRoute = "thankYou";
  static const String mainRoute = "mainRoute";
}

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case AppRoutes.onboardingRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  BlocProvider(
  create: (context) => OnboardingCubit(),
  child: const OnboardingView(),
));
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                create: (BuildContext context) =>
                    LoginCubit(getIt.get<AuthenticationRepoImpl>()),
                child: const LoginView()));
      case AppRoutes.signUpRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (context) =>
                      SignUpCubit(getIt.get<AuthenticationRepoImpl>()),
                  child: const SignUpView(),
                ));
      case AppRoutes.forgetPasswordRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgetPassword());
      case AppRoutes.loginSuccessRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginSuccessView());
      case AppRoutes.homeViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => MultiBlocProvider(
              providers:  [
                BlocProvider(
                  create: (BuildContext context) =>
                  HomeCategorisesCubit(getIt.get<HomeRepoImpl>())
                    ..getCategoriesData(),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                  HomeBannersCubit(getIt.get<HomeRepoImpl>())..getBannersData(),
                ),
                BlocProvider(
                  create: (context) =>
                  HomeCubit()..checkInternet(),

                ),
              ],
              child: const HomeView(),
            ));
      case AppRoutes.productDetailsRoute:
        final ProductListData model = settings.arguments  as ProductListData;
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (BuildContext context) => ProductDetailsCubit(),
                  child: ProductDetailsView(
                    model: model,
                  ),
                ));
      case AppRoutes.searchViewRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                create: (BuildContext context) =>
                    SearchProductCubit(getIt.get<HomeRepoImpl>()),
                child: const SearchView()));
      case AppRoutes.myAccountRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                create: (BuildContext context) => ProfileCubit(getIt.get<ProfileRepoImpl>())..getProfileData(),
                child: const MyAccountView()));
      case AppRoutes.addToCardViewRoute:
        return MaterialPageRoute(builder: (BuildContext context) =>const AddToCardView());
      case AppRoutes.paymentRoute:
        final AddToCardModel model = settings.arguments as AddToCardModel;
        return MaterialPageRoute(builder: (context) =>  Payment1View(model: model,));
      case AppRoutes.paymentDetailsRoute:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => PaymentCubit(),
              child: const PaymentDetails(),
            ));
      case AppRoutes.thankYouRoute:
        return MaterialPageRoute(builder: (context) => const ThankYouView());
      case AppRoutes.mainRoute:
        return MaterialPageRoute(builder: (context) => const MyApp());

      default:
        return RouteGenerator.noRoute();
    }
  }

  static Route<dynamic> noRoute() {
    return MaterialPageRoute(
        builder: (BuildContext context) => const Scaffold(
              body: Center(child: Text(AppString.noRoute)),
            ));
  }
}
