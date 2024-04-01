import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/home/presentation/manager/home_banners_cubit/home_banners_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_categorises_cubit/home_categorises_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../core/util/app_color.dart';
import '../manager/home_product_cubit/home_product_cubit.dart';

class HomeViewDesign extends StatelessWidget {
  const HomeViewDesign(
      {super.key,
      required this.homeUpperPart,
      required this.homeLowerImageAndText,
      required this.homeLowerList});

  final Widget homeUpperPart;
  final Widget homeLowerList;
  final Widget homeLowerImageAndText;

  static Future<void> onRefresh(context) async {
    HomeCubit.getInstance(context).checkInternet();
    BlocProvider.of<HomeCategorisesCubit>(context).getCategoriesData();
    BlocProvider.of<HomeBannersCubit>(context).getBannersData();
    BlocProvider.of<HomeProductCubit>(context).getProductData();
    BlocProvider.of<HomeProductCubit>(context).getFavoriteData();
    BlocProvider.of<HomeProductCubit>(context).getCard();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: AppColor.green,
        onRefresh: () {
          return onRefresh(context);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [

            SliverToBoxAdapter(
              child: homeUpperPart,
            ),
            SliverToBoxAdapter(child: homeLowerImageAndText),
            SliverPadding(
                padding: const EdgeInsets.all(10), sliver: homeLowerList)
          ],
        ));
  }
}
