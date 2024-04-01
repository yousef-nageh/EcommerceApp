import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/home/presentation/manager/home_banners_cubit/home_banners_cubit.dart';
import 'package:shop_app/feature/home/presentation/manager/home_banners_cubit/home_banners_state.dart';

import 'banner_image_item.dart';
import 'home_waiting_banners.dart';

class HomeBannerImage extends StatelessWidget {
  const HomeBannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBannersCubit, HomeBannersStates>(
      builder: (BuildContext context, state) {
        if (state is HomeGetBannersSuccessState) {
          return CarouselSlider.builder(
            itemCount: state.model.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index, int realIndex) =>BannerImageItem(model: state.model.data?[index],),

            options: CarouselOptions(
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: 19.hR(),
                enlargeCenterPage: true,
                autoPlayAnimationDuration: const Duration(seconds: 2),

                enableInfiniteScroll: true,

                autoPlay: true,
                viewportFraction: 1),
          );
        } else {
          return const HomeWaitingBanners();
        }
      },
    );
  }
}
