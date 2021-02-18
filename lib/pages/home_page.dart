import 'package:flutter/material.dart';

import 'package:flutter_marketplace/widgets/product_cards_widget.dart';
import 'package:flutter_marketplace/widgets/shop_banners_widget.dart';
import 'package:flutter_marketplace/widgets/horizontal_banners_widget.dart';
import 'package:flutter_marketplace/widgets/square_banners_widget.dart';
import 'package:flutter_marketplace_service/service/category/category_api_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categoryRepository = CategoryRepository();

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
          ProductCardsWidget(
            title: "Лучшие продажи",
            perCol: 3,
            type: 'getOfBestSeller',
          ),
          HorizontalBannersWidget(),
          ProductCardsWidget(
            title: "Предложения дня",
            perCol: 3,
            type: 'getOfTodaysDeal',
          ),
          Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }
}
