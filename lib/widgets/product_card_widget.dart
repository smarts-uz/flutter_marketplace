import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';

import 'package:get/get.dart';

class ProductCardWidget extends StatefulWidget {
  ProductCardWidget({Key key, this.named}) : super(key: key);

  final bool named;

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  int _itemCount = 0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Column(
        children: [
          InkWell(
            onTap: () => {Get.toNamed("/product")},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 3, top: 6),
                    child: Stack(
                      children: [
                        InkWell(
                          child: Image.asset(
                            'assets/best-beal.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 8,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4.3,
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
                        child: Text(
                          "Бестселлер",
                          style: TextStyle(
                            color: HexColor("#CAAE81"),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            Text(
                              "14 990 P",
                              style: TextStyle(
                                color: HexColor("#BC3061"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 3),
                              child: Text(
                                "14 990 P",
                                style: TextStyle(
                                  color: HexColor("#2A1C28"),
                                  fontSize: 11,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: HexColor("#BC3061"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      widget.named
                          ? Container(
                              width: double.infinity,
                              child: Text(
                                "Redmi Note 9 Pro Max / Redmi Note 9 Pro",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                softWrap: false,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _getCounterBtn(),
          )
        ],
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
                HexColor("#FB0F5A"),
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
                HexColor("#005AFC"),
              )
            ]),
          )
        : Container(
            padding: EdgeInsets.only(top: 4),
            width: double.infinity,
            child: RaisedButton(
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
      child: Icon(icon, color: Colors.white, size: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
