import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/widgets/cache_image_widget.dart';
import 'package:flutter_marketplace_service/service/banner/banner_repository.dart';
import 'package:flutter_marketplace_service/service/banner/cubit/banner_cubit.dart';

import 'package:shimmer/shimmer.dart';

class ShopBannersWidget extends StatefulWidget {
  ShopBannersWidget({Key key}) : super(key: key);

  @override
  _ShopBannersWidgetState createState() => _ShopBannersWidgetState();
}

class _ShopBannersWidgetState extends State<ShopBannersWidget> {
  int _currentBanner = 0;
  final bannersRepository = BannersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannerCubit>(
      create: (context) => BannerCubit(bannersRepository)..fetchBanners(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: BlocBuilder<BannerCubit, BannerState>(
          builder: (context, state) {
            // final BannerCubit shopBannerCubit = context.watch<BannerCubit>();

            if (state is BannerInitial || state is BannerLoadingState) {
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
            } else if (state is BannerLoadedState) {
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
                      state.banner.sliders.data.length,
                      (index) => Container(
                        width: double.infinity,
                        child: InkWell(
                          child: CacheImageWidget(
                            url: state.banner.sliders.data[index].photo,
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
                          state.banner.sliders.data.length,
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
              return Container();
            }
          },
        ),
      ),
    );
  }
}
