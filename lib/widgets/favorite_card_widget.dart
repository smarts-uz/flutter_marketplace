import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';

import '../extensions/hex_color.dart';

class FavoriteCardWidget extends StatefulWidget {
  // FavoriteCardWidget(bool named, {Key key}) : super(key: key);
  @override
  _FavoriteCardWidgetState createState() => _FavoriteCardWidgetState();
}

class _FavoriteCardWidgetState extends State<FavoriteCardWidget> {
  int _currentBanner = 0;
  int _currentCategory = 0;
  int _itemCount = 0;
  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 3.2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 9,horizontal: 6),
        width: MediaQuery
            .of(context)
            .size
            .width / 3.5,
        child: Column(
          children: [
            InkWell(
              // onTap: () => {Get.toNamed("/product")},
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 3, top: 6),
                    height: MediaQuery
                        .of(context)
                        .size
                        .width / 3.3,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            // autoPlay: true,
                            // height: 150,
                            // aspectRatio: 1,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
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
                                  // fit: BoxFit.cover,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // width: MediaQuery.of(context).size.width,
                          // bottom: 0,
                          // left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 55,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                6,
                                    (index) => Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin:
                                  EdgeInsets.symmetric(vertical: 0, horizontal: 3.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentBanner == index
                                        ? Colors.white
                                        : HexColor("#D6D9DE"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),



                        // InkWell(
                        //   child: Image.asset(
                        //     'assets/best-beal.png',
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        Positioned(
                          top: 0,
                          left: 8,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 4.3,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: HexColor("#7D38A5"),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Часто покупаете?",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 2,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                // _isFavorite = !_isFavorite;
                                _isFavorite = !_isFavorite;
                              });
                            },
                            child: _isFavorite
                                ? Icon(
                              Icons.favorite,
                              color: HexColor("#FB0F5A"),
                              size: 35.0,
                            )
                                : Stack(children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: HexColor("#FB0F5A"),
                                  size: 35.0,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: HexColor("#FB0F5A"),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "—40%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Wrap(
                          children: [
                            Text(
                              "14 990 P",
                              style: TextStyle(
                                color: HexColor("#FF4170"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 3),
                              child: Text(
                                "14 990 P",
                                style: TextStyle(
                                  color: HexColor("#4c4c4c"),
                                  fontSize: 11,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: HexColor("#FF4170"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        child: Text(
                          "Бестселлер",
                          style: TextStyle(
                            color: HexColor("#4c4c4c"),
                            fontSize: 12,
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        child: Text(
                          "22₽ / шт",
                          style: TextStyle(
                            color: HexColor("#4c4c4c"),
                            fontSize: 12,
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        child: Text(
                          "Premium Care, 9-15 kg, rezmer",
                          style: TextStyle(
                            color: HexColor("#4c4c4c"),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        child: Text(
                          "Premium Care, 9-15 kg, rezmer",
                          style: TextStyle(
                            color: HexColor("#4c4c4c"),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        child: Text(
                          "4,76 шт",
                          style: TextStyle(
                            color: HexColor("#4c4c4c"),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: _getCounterBtn(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCounterBtn() {
    return _itemCount > 0
        ? Container(
      padding: EdgeInsets.only(top: 10, bottom: 6),
      child: Row(children: [
        _createIncrementDicrementButton(
          Icons.remove,
              () => setState(() => _itemCount--),
          // HexColor("#FB0F5A"),
          HexColor("#F0F4F4"),
        ),
        Expanded(
          child: Text(
            _itemCount.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        _createIncrementDicrementButton(
          Icons.add,
              () => setState(() => _itemCount++),
          // HexColor("#005AFC"),
          HexColor("#F0F4F4"),
        )
      ]),
    )
   :Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Row(
            children: [
          // padding: EdgeInsets.only(top: 4),
          // width: double.infinity,
          RaisedButton(
          onPressed: () => setState(() => _itemCount++),
          child: Text(
          "В корзину",
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 1,
          softWrap: false,
          ),
          color: HexColor("#005AFC"),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          ),
          ),

          ],
          ),
          InkWell(
            onTap: (){
              showBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    // color: Colors.red,
                    height: 250,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              10, 10, 10, 10),
                          child: new Row(
                            children: [
                              new Icon(
                                Icons.add
                              ),
                              new Text(
                                "Добавить в список",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),

                        new Text(
                        "Регулярная доставка",
                        style: TextStyle(color: Colors.black),
                        ),

                      ],
                    ),
                  ));
            },
            child: Container(
              color: HexColor("#F0F4F4"),
              child: new Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 25.0,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _createIncrementDicrementButton(
      IconData icon, Function onPressed, Color color) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 36.0, minHeight: 36.0),
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: color,
      child: Icon(icon, color: HexColor("#005AFC"), size: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}