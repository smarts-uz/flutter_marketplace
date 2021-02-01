import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace_service/config.dart';

class CacheImageWidget extends StatelessWidget {
  CacheImageWidget({
    Key key,
    this.url,
    this.catchUrl,
    this.height,
  }) : super(key: key);

  final String url;
  final String catchUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    final fileUrl = url.isEmpty ? catchUrl : "${Config.filesUrl}$url";

    return CachedNetworkImage(
      height: height,
      imageUrl: fileUrl,
      errorWidget: (context, url, error) => Image.asset(
        'assets/default-image.png',
      ),
    );
  }
}
