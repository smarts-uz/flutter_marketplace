import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';

class CartItemWidget extends StatefulWidget {
  CartItemWidget({Key key}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  bool isChecked = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isChecked
                                    ? HexColor("#0757F6")
                                    : MyColors.white,
                                border: Border.all(
                                  color: isChecked
                                      ? HexColor("#0757F6")
                                      : MyColors.zumthor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  isChecked
                                      ? Icons.check
                                      : Icons.check_box_outline_blank,
                                  size: 15,
                                  color: MyColors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Image.asset("assets/best-beal.png", width: 100),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  Text(
                                    "14 990 P",
                                    style: TextStyle(
                                      color: MyColors.hibiscus,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 3),
                                    child: Text(
                                      "14 990 P",
                                      style: TextStyle(
                                        color: MyColors.thunder,
                                        fontSize: 11,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: MyColors.hibiscus,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Text("Набор кухонных"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.ripeLemon,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  margin: EdgeInsets.only(left: 10, top: 8),
                  child: Text("Частями по 112 руб / мес"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.ripeLemon,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 8),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text("Частями"),
                ),
              ],
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        })
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 4,
                        ),
                        child: Row(
                          children: [
                            _isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: MyColors.red,
                                  )
                                : Stack(children: [
                                    Icon(
                                      Icons.favorite,
                                      color: MyColors.white,
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: MyColors.black,
                                      ),
                                    ),
                                  ]),
                            SizedBox(width: 6),
                            Text("В избранное"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 4,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.delete_outline),
                            SizedBox(width: 6),
                            Text("Удалить"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("1 шт."),
                    SizedBox(width: 5),
                    Icon(Icons.unfold_more)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
