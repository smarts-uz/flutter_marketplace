import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/widgets/best_selling_widget.dart';

import 'package:flutter_marketplace/widgets/product_cards_widget.dart';
import 'package:flutter_marketplace/widgets/shop_banners_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBanner = 0;
  int _currentCategory = 0;

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {
    return Future.delayed(Duration(milliseconds: 1000)).then((onValue) => null);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ShopBannersWidget(),
          _getCategory(),
          BestSellingWidget(
            title: "Лучшее предложение",
            named: false,
            vertical: false,
            perCol: 3,
            type: "getOfFeatured",
          ),
          _getProfitable("Это выгодно! Успей купить!"),
          ProductCardsWidget(
            title: "Скидки до 80%",
            count: 3,
            named: false,
            list: false,
            perCol: 3,
          ),
          _getBanner(),
          ProductCardsWidget(
            title: "Новогодняя распродажа",
            count: 3,
            named: false,
            list: false,
            perCol: 3,
          ),
          _getProfitable("Покупки сезона", named: true),
          ProductCardsWidget(
            title: "Бесплатная доставка по всему миру",
            count: 6,
            named: true,
            list: false,
            perCol: 3,
          ),
          Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }

  Widget _getCategory() {
    // return
    //      Shimmer.fromColors(
    //     baseColor: MyColors.shimmerBaseColor,
    //     highlightColor: MyColors.shimmerHighlightColor,
    //     child:
    //     Stack(
    //   children: [
    //     CarouselSlider(
    //       options: CarouselOptions(
    //         viewportFraction: 1,
    //         enlargeCenterPage: false,
    //         onPageChanged: (index, reason) {
    //           setState(() {
    //             _currentCategory = index;
    //           });
    //         },
    //       ),
    //       items: List.generate(
    //         2,
    //         (_) => Wrap(
    //           runSpacing: 15,
    //           children: List.generate(
    //             10,
    //             (index) => Container(
    //               width: MediaQuery.of(context).size.width / 5.6,
    //               child: Column(
    //                 children: [
    //                   Container(
    //                     padding: EdgeInsets.only(bottom: 6),
    //                     height: 55,
    //                     width: 55,
    //                     decoration: BoxDecoration(
    //                       color: MyColors.white,
    //                       borderRadius: BorderRadius.circular(8),
    //                     ),
    //                   ),
    //                   Container(
    //                     margin: EdgeInsets.only(left: 2, right: 2, top: 2),
    //                     width: double.infinity,
    //                     height: 10,
    //                     color: MyColors.white,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       width: MediaQuery.of(context).size.width,
    //       bottom: 0,
    //       left: 0,
    //       child: Container(
    //         padding: EdgeInsets.symmetric(
    //           horizontal: 8,
    //           vertical: 2,
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: List.generate(
    //             2,
    //             (index) => Container(
    //               width: 8.0,
    //               height: 8.0,
    //               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
    //               decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: _currentCategory == index
    //                     ? MyColors.tangaroa
    //                     : MyColors.iron,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    //   ),
    // );
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
                        child: InkWell(
                          child: Image.asset(
                            'assets/catalog.png',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        child: Text(
                          "Каталог46545sda asda dsfsdf sfsdfsd sdfsdfsfs sdfsdf",
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
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
  }

  Widget _getProfitable(String title, {named: false}) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: MyColors.mirage,
          ),
        ),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          children: List.generate(
            6,
            (index) => Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: MediaQuery.of(context).size.width / 3.2,
                  height: MediaQuery.of(context).size.width / 3.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      child: Image.asset(
                        'assets/profitable.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                named
                    ? Container(
                        padding: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                        width: MediaQuery.of(context).size.width / 3.2,
                        child: Text(
                          "65465465465asdadas ksdjfgksjhdgf skjhdgfkjsdf",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width / 3.2,
                      )
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _getBanner() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Stack(
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
              6,
              (_) => Container(
                width: double.infinity,
                child: InkWell(
                  child: Image.asset(
                    'assets/banner.jpg',
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
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
      ),
    );
  }
}
