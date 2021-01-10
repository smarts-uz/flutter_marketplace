import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace/provider/cart_provider.dart';
import 'package:flutter_marketplace/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<CartProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 0, 0),
          child: Container(
            child: Text(
              "Корзина",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Divider(height: 1.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Container(
            color: MyColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: HexColor("#0757F6")),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: true
                            ? Icon(
                                Icons.check,
                                size: 15.0,
                                color: MyColors.white,
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                size: 20.0,
                                color: HexColor("#0757F6"),
                              ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Выбрать все"),
                  ],
                ),
                Text(
                  "Удалить выбранные",
                  style: TextStyle(color: MyColors.red),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(242, 243, 245, 1),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: InkWell(
                          onTap: () {
                            myProvider.openSearchScreen(context);
                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.0),
                                  Text(
                                    "Населенний пункт",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 12.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Москва",
                                        style: TextStyle(
                                            color: HexColor("#0757F6"),
                                            fontSize: 14.0),
                                      ),
                                      SizedBox(width: 125),
                                      Icon(
                                        Icons.unfold_more,
                                        size: 16.0,
                                        color: Colors.black,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Divider(height: 1),
                      ),
                      SizedBox(height: 30.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Доставка Ozon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.train_outlined,
                                color: Colors.black,
                              ),
                              Text("Курьром"),
                              SizedBox(width: 10),
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                              ),
                              Text("Курьром"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                    ],
                  ),
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    color: Color.fromRGBO(242, 243, 245, 1),
                    height: 8.0,
                  ),
                  itemBuilder: (context, index) => CartItemWidget(),
                ),
                Container(
                  color: Color.fromRGBO(242, 243, 245, 1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 16),
                    child: Column(
                      children: [
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ваша корзина",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "3-товая *773",
                              style: TextStyle(color: Colors.black45),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Товары (3)",
                                style: TextStyle(color: Colors.black45)),
                            Text(
                              "29 079 p",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Скидка",
                                style: TextStyle(color: Colors.black45)),
                            Text(
                              "-11 321 P",
                              style: TextStyle(
                                  color: MyColors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Подробнее",
                              style: TextStyle(color: HexColor("#0757F6")),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Divider(height: 1.0),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Общая стоимость",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "23 748 P",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: HexColor("#0757F6"),
                            onPressed: () => null,
                            child: Text(
                              "Перейти к оформлению",
                              style: TextStyle(
                                color: MyColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Доступные способы и время доставки можно\nвыбрать при оформленнии заказа",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
