import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/widget/waiting_image_loading.dart';
import 'package:shop_app/core/util/app_color.dart';

class MYCacheNetworkImage extends StatelessWidget {
  const MYCacheNetworkImage({super.key, required this.imageLink,  this.width,  this.height, required this.boxFit});
final String imageLink;
final double? width;
  final double? height;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(imageUrl: imageLink,width: width,height:height ,fit: boxFit,
      placeholder: (context, url) => const WaitingImageLoading(),
      errorWidget: (context, url, error) => Icon(Icons.info_outline_rounded,color: AppColor.red,),
    );
  }
}
