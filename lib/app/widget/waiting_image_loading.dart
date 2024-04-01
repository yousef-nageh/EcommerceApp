import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/core/util/app_image.dart';

class WaitingImageLoading extends StatelessWidget {
  const WaitingImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(AppImage.waitingImage);
  }
}
