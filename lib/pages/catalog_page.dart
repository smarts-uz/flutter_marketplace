import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:shimmer/shimmer.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return _getCategory();
  }

  Widget _getCategory() {
    return
        //  Shimmer.fromColors(
        // baseColor: MyColors.shimmerBaseColor,
        // highlightColor: MyColors.shimmerHighlightColor,
        // child:
        SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Wrap(
        children: List.generate(
          20,
          (index) => InkWell(
            onTap: () => {Navigator.pushNamed(context, "/in_catalog")},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 6),
                    height: 75,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        // child: Container(
                        //   padding: EdgeInsets.only(bottom: 6),
                        //   height: 55,
                        //   width: 55,
                        //   decoration: BoxDecoration(
                        //     color: MyColors.white,
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        // ),
                        child: Image.asset(
                          'assets/catalog.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    child: Container(
                      margin: EdgeInsets.only(left: 2, right: 2, top: 2),
                      width: double.infinity,
                      height: 10,
                      color: MyColors.white,
                    ),
                    // child: Text(
                    //   "Шоколад и сладости asda dsfsdf sfsdfsd sdfsdfsfs sdfsdf",
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w600,
                    //     color: MyColors.racingGreen,
                    //   ),
                    //   overflow: TextOverflow.ellipsis,
                    //   textAlign: TextAlign.center,
                    //   maxLines: 2,
                    //   softWrap: false,
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
