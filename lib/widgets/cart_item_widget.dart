import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';

class CartItemWidget extends StatefulWidget {
  CartItemWidget({Key key}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  TextEditingController controller = new TextEditingController();
  bool isChecked = false;
  bool _isFavorite = false;
  bool _istextnumber = false;
  bool _iconvisible = false;
  String number = "a";

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  child: InkWell(
                    onTap: () => {
                      showBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (context) => StatefulBuilder(
                          builder: (context, setState) => SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Container(
                              // height: 600,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Выберите количество",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 170),
                                        InkWell(
                                          onTap: () => {},
                                          child: Text(
                                            "Закрыть",
                                            style: TextStyle(
                                                color: HexColor("#467FD2")),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "1",
                                            setState(() {})
                                          },
                                      "1"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "2",
                                            setState(() {})
                                          },
                                      "2"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "3",
                                            setState(() {})
                                          },
                                      "3"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "4",
                                            setState(() {})
                                          },
                                      "4"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "5",
                                            setState(() {})
                                          },
                                      "5"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "6",
                                            setState(() {})
                                          },
                                      "6"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "7",
                                            setState(() {})
                                          },
                                      "7"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "8",
                                            setState(() {})
                                          },
                                      "8"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = false,
                                            _iconvisible = true,
                                            number = "9",
                                            setState(() {})
                                          },
                                      "9"),
                                  _listItemnumber(
                                      () => {
                                            _istextnumber = true,
                                            _iconvisible = true,
                                            number = "10+",
                                            setState(() {})
                                          },
                                      "10+",
                                      divider: false),
                                  Visibility(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          labelText: "Количество товаров",
                                          fillColor: Colors.black,
                                        ),
                                      ),
                                    ),
                                    visible: _istextnumber,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    },
                    child: Row(
                      children: [
                        Text("1 шт."),
                        SizedBox(width: 5),
                        Icon(Icons.unfold_more)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItemnumber(Function onTap, String text,
      {IconData icon, primary = false, divider = true}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 18),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icon != null
                          ? Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Icon(
                                icon,
                                color: primary
                                    ? MyColors.mariner
                                    : MyColors.blackBean,
                                size: 34,
                              ),
                            )
                          : Container(),
                      Container(
                        padding: EdgeInsets.only(left: icon != null ? 12 : 0),
                        child: Text(
                          text,
                          style: TextStyle(
                            color:
                                primary ? MyColors.mariner : MyColors.blackBean,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.check,
                        color: HexColor("#467FD2"),
                        size: 18,
                      ),
                    ),
                    visible: _iconvisible,
                  )
                ],
              ),
            ),
            divider ? Divider(height: 1) : Container()
          ],
        ),
      ),
    );
  }
}
