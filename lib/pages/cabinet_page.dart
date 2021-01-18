import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/provider/cabinet_provider.dart';

import 'package:flutter_marketplace/widgets/product_cards_widget.dart';
import 'package:provider/provider.dart';

class CabinetPage extends StatefulWidget {
  CabinetPage({Key key}) : super(key: key);

  @override
  _CabinetPageState createState() => _CabinetPageState();
}

class _CabinetPageState extends State<CabinetPage> {
  bool isAuth = false;
  CabinetProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<CabinetProvider>(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        isAuth
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 50),
                decoration: BoxDecoration(color: MyColors.blue),
                child: InkWell(
                  onTap: () => {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: MyColors.athensGray,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 100,
                                color: MyColors.blue,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20, bottom: 25),
                              child: Text(
                                "Мои данные",
                                style: TextStyle(color: MyColors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        color: MyColors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 34),
                decoration: BoxDecoration(color: MyColors.zumthor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Войдите или заргеистируйтесь",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Text(
                          "Чтобы делать покупки, отслеживать заказы и пользоваться персональный скидкаи и баллами."),
                    ),
                    // Container(
                    //   width: double.infinity,
                    // child:
                    Row(children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: MyColors.blue,
                          elevation: 0,
                          onPressed: () => {
                            setState(() => {
                     //         isAuth = !isAuth,
                             myProvider.openRegistrationScreen(context),
                            }
                            )
                          },
                          child: Text(
                            "Войти или зарегистрироватся",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      ),
                    ])
                    // )
                  ],
                ),
              ),
        Container(
          decoration: BoxDecoration(color: MyColors.athensGray),
          height: 30,
        ),
        _listItem(
          () => {
            myProvider.listItemLocation(context)
          },
          "Ташкент",
          icon: Icons.location_on_outlined,
          primary: true,
        ),
        _listItem(() => {}, "Пункты выдачи на карте"),
        _listItem(() => {}, "Стоимость доставки", divider: false),
        Container(
          decoration: BoxDecoration(color: MyColors.athensGray),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            "Покупки".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
          ),
        ),
        _listItem(() => {}, "Заказы"),
        _listItem(() => {}, "Купленные товары", divider: false),
        Container(
          decoration: BoxDecoration(color: MyColors.athensGray),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            "Помощь".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
          ),
        ),
        _listItem(() => {}, "Способы доставки"),
        _listItem(() => {}, "Способы оплаты"),
        _listItem(() => {}, "Помощь", divider: false),
        Container(
          decoration: BoxDecoration(color: MyColors.athensGray),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            "Приложение".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
          ),
        ),
        _listItem(() => {
          myProvider.accountSecurity(context)
        }, "Аккоунт и безопасность"),
        _listItem(() => {
          myProvider.aboutApp(context)
        }, "О приложении", divider: false),
        Container(
          decoration: BoxDecoration(color: MyColors.athensGray),
          height: 30,
        ),
        ProductCardsWidget(
          count: 10,
          named: true,
          perCol: 2,
          title: "Лучшее для вас",
          list: false,
        ),
        Padding(padding: EdgeInsets.all(15))
      ],
    );
  }

  Widget _listItem(Function onTap, String text,
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
                  Icon(
                    Icons.chevron_right_outlined,
                    color: MyColors.tiara,
                    size: 30,
                  )
                ],
              ),
            ),
            divider ? Divider(height: 0) : Container()
          ],
        ),
      ),
    );
  }
}
