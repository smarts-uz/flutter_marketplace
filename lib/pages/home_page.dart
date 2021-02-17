import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';

import 'package:flutter_marketplace/widgets/product_cards_widget.dart';
import 'package:flutter_marketplace/widgets/shop_banners_widget.dart';
import 'package:flutter_marketplace/widgets/square_banners_widget.dart';
import 'package:flutter_marketplace_service/service/category/category_api_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBanner = 0;
  final categoryRepository = CategoryProvider();

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
        cacheExtent: 999999999999999,
        addAutomaticKeepAlives: true,
        children: [
          ShopBannersWidget(),
          ProductCardsWidget(
            title: "Рекомендуемые товары",
            perCol: 3,
            type: "getOfFeatured",
          ),
          SquareBannersWidget(title: "Это выгодно! Успей купить!"),
          _getBanner(),
          ProductCardsWidget(
            title: "Лучшие продажи",
            perCol: 3,
            type: 'getOfBestSeller',
          ),
          ProductCardsWidget(
            title: "Предложения дня",
            perCol: 3,
            type: 'getOfTodaysDeal',
          ),
          _getProfitable("Покупки сезона", named: true),
          Padding(padding: EdgeInsets.all(10)),
        ],
      ),
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
