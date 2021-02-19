import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/utils/colors.dart';
import 'package:flutter_marketplace/widgets/product_cards_widget.dart';

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
          Container(
            padding: EdgeInsets.only(top: 8, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
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
                      // Container(
                      //   width: double.infinity,
                      //   child: Text(
                      //     "10 497 товаров",
                      //     style: TextStyle(
                      //       color: MyColors.gunsmoke,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // IconButton(
                //   onPressed: () => {},
                //   icon: Icon(Icons.share_outlined),
                // )
              ],
            ),
          ),
          ProductCardsWidget(
            perCol: 3,
            type: "getOfCategory",
            categoryId: category.id,
          ),
          Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }
}
