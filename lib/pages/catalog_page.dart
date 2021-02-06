import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace_service/config.dart';
import 'package:flutter_marketplace_service/service/category/category_api_provider.dart';
import 'package:flutter_marketplace_service/service/category/cubit/category_cubit.dart';
import 'package:shimmer/shimmer.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final categoryRepository = CategoryProvider();
  int _currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>(
        create: (context) => CategoryCubit(categoryRepository)..getAll(),
        child: _getCategory());
  }

  Widget _getCategory() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial || state is CategoryLoadingState) {
          return Shimmer.fromColors(
            baseColor: MyColors.shimmerBaseColor,
            highlightColor: MyColors.shimmerHighlightColor,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentCategory = index;
                      });
                    },
                  ),
                  items: List.generate(
                    2,
                        (_) => Wrap(
                      runSpacing: 15,
                      children: List.generate(
                        10,
                            (index) => Container(
                          width: MediaQuery.of(context).size.width / 5.6,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 6),
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Container(
                                margin:
                                EdgeInsets.only(left: 2, right: 2, top: 2),
                                width: double.infinity,
                                height: 10,
                                color: MyColors.white,
                              ),
                            ],
                          ),
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
                        2,
                            (index) => Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentCategory == index
                                ? MyColors.tangaroa
                                : MyColors.iron,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        else if(state is CategoryLoadedState){
          return Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCategory = index;
                    });
                  },
                ),
                items: List.generate(
                  2,
                      (_) => // state.banner.sliders.data.length
                  Wrap(
                    runSpacing: 15,
                    children: List.generate(
                      state.list.data.length,
                          (index) => Container(
                        width: MediaQuery.of(context).size.width / 5.6,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 6),
                              height: 55,
                              width: 55,
                              child: InkWell(
                                child:
                                state.list.data[index].icon != null
                                    ? CachedNetworkImage(
                                  imageUrl:
                                  "${Config.filesUrl}/${state.list.data[index].icon}",
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
                                ):
                                Image.asset(
                                  'assets/catalog.png',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              width: double.infinity,
                              child: state.list.data[index].name != null
                                  ? Text(state.list.data[index].name)
                                  : Text(
                                "null",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
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
                      2,
                          (index) => Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentCategory == index
                              ? MyColors.tangaroa
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
    );
  }
}
