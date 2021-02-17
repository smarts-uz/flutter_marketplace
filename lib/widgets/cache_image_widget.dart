import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace_service/config.dart';
import 'package:shimmer/shimmer.dart';

class CacheImageWidget extends StatelessWidget {
  CacheImageWidget({
    Key key,
    this.url = "",
    this.height,
    this.fit,
  }) : super(key: key);

  final String url;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final defaultImg = 'assets/default-image.png';

    if (url.isEmpty) {
      return Container(
        height: height,
        child: Image.asset(
          defaultImg,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return CachedNetworkImage(
        height: height,
        imageUrl: "${Config.filesUrl}$url",
        errorWidget: (context, url, error) => Image.asset(
          defaultImg,
          height: height,
          fit: BoxFit.cover,
        ),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: MyColors.shimmerBaseColor,
          highlightColor: MyColors.shimmerHighlightColor,
          child: Container(color: Colors.white),
        ),
      );
    }
  }
}
