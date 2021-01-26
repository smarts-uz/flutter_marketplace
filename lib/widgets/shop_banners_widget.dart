import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_service/service/brand/brand_repository.dart';
import 'package:flutter_marketplace_service/service/brand/cubit/brand_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ShopBannersWidget extends StatefulWidget {
  ShopBannersWidget({Key key}) : super(key: key);

  @override
  _ShopBannersWidgetState createState() => _ShopBannersWidgetState();
}

class _ShopBannersWidgetState extends State<ShopBannersWidget> {
  int _currentBanner = 0;
  final brandRepository = BrandRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrandCubit>(
      create: (context) => BrandCubit(brandRepository)..fetchBanners(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: BlocBuilder<BrandCubit, BrandState>(
          builder: (context, state) {
            // final BrandCubit shopBannerCubit = context.watch<BrandCubit>();

            if (state is BrandEmptyState || state is BrandLoadingState) {
              return Shimmer.fromColors(
                baseColor: MyColors.shimmerBaseColor,
                highlightColor: MyColors.shimmerHighlightColor,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    height: 150,
                    aspectRatio: 1,
                    enlargeCenterPage: true,
                  ),
                  items: List.generate(
                    3,
                    (_) => Container(
                      width: double.infinity,
                      color: MyColors.white,
                    ),
                  ),
                ),
              );
            } else if (state is BrandLoadedState) {
              return Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 150,
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentBanner = index;
                        });
                      },
                    ),
                    items: List.generate(
                      state.banners.length,
                      (index) => Container(
                        width: double.infinity,
                        child: InkWell(
                          child: state.banners[index].logo != null
                              ? CachedNetworkImage(
                                  imageUrl: state.banners[index].logo,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/carousel.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                                  'assets/carousel.jpg',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.banners.length,
                          (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 2.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentBanner == index
                                  ? MyColors.white
                                  : MyColors.iron,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Text('error');
            }
          },
        ),
      ),
    );
  }
}
