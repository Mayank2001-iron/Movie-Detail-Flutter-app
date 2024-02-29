
// ignore: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomCachedImage extends StatelessWidget {
  String imgUrl;
  double radius;
  CustomCachedImage({super.key,required this.imgUrl, this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        key: UniqueKey(),
        imageUrl: imgUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) =>LottieBuilder.asset('assets/images/error_animation.json'),
      ),
    );
  }
}
