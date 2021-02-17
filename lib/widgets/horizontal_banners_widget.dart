import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/widgets/cache_image_widget.dart';

import 'package:flutter_marketplace_service/service/banner/banner_repository.dart';
import 'package:flutter_marketplace_service/service/banner/cubit/banner_cubit.dart';

import 'package:shimmer/shimmer.dart';

class SquareBannersWidget extends StatefulWidget {
  SquareBannersWidget({Key key}) : super(key: key);

  @override
  _SquareBannersWidgetState createState() => _SquareBannersWidgetState();
}

class _SquareBannersWidgetState extends State<SquareBannersWidget> {
  final bannersRepository = BannersRepository();
  int _currentBanner = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannerCubit>(
      create: (context) => BannerCubit(bannersRepository)..fetchBanners(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 5),
        child: BlocBuilder<BannerCubit, BannerState>(
          builder: (context, state) {
            // final BannerCubit shopBannerCubit = context.watch<BannerCubit>();

            if (state is BannerInitial || state is BannerLoadingState) {
              return Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 150,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentBanner = index;
                        });
                      },
                    ),
                    items: List.generate(
                      3,
                      (index) => Container(
                        width: double.infinity,
                        child: Shimmer.fromColors(
                          baseColor: MyColors.shimmerBaseColor,
                          highlightColor: MyColors.shimmerHighlightColor,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: MyColors.white,
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
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 2,
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
            } else if (state is BannerLoadedState) {
              var banners = state.banner.bannerHorizontal.data;
              return Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 150,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentBanner = index;
                        });
                      },
                    ),
                    items: List.generate(
                      banners.length,
                      (index) => Container(
                        width: double.infinity,
                        child: InkWell(
                          child: CacheImageWidget(
                            url: banners[index].photo,
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
                          6,
                          (index) => Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 2,
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
              return Container();
            }
          },
        ),
      ),
    );
  }
}
