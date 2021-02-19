import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/utils/colors.dart';

import 'package:flutter_marketplace_service/models/category_response.dart';

class InCatalogPage extends StatefulWidget {
  InCatalogPage({
    Key key,
    @required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  _InCatalogPageState createState() => _InCatalogPageState();
}

class _InCatalogPageState extends State<InCatalogPage> {
  int _currentBanner = 0;

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {
    return Future.delayed(Duration(milliseconds: 1000)).then((onValue) => null);
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.category;

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 18),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: MyColors.blueCharcoal,
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "10 497 товаров",
                          style: TextStyle(
                            color: MyColors.gunsmoke,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(Icons.share_outlined),
              )
            ],
          ),

          _getProfitable("", isName: true),
          // ProductCardsWidget(
          //   title: "Скидки до 80%",
          //   named: false,
          //   vertical: false,
          //   perCol: 3,
          // ),
          _getBanner(),
          // ProductCardsWidget(
          //   title: "Новогодняя распродажа",
          //   named: false,
          //   vertical: false,
          //   perCol: 3,
          // ),
          // ProductCardsWidget(
          //   title: "Бесплатная доставка по всему миру",
          //   named: true,
          //   vertical: false,
          //   perCol: 3,
          // ),
          Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }

  Widget _getProfitable(String title, {isName: false}) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
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
                isName
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
