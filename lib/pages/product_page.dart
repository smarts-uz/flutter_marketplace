import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace/widgets/product_cards_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:share/share.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 1);

  bool isFavorite = false;
  int isSize = 0;

  TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: _getFooter(),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 7),
            child: InkWell(
              onTap: () => {Navigator.pop(context)},
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
          Expanded(child: Text("")),
          Row(children: [
            __getAppBarButton(Icons.share, () {
              var url = 'Hallo from marketplace!';
              Share.share(url);
            }),
            __getAppBarButton(
              isFavorite ? Icons.favorite : Icons.favorite_outline,
              () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              color: HexColor(isFavorite ? "#F61255" : "#000000"),
            ),
            __getAppBarButton(Icons.shopping_bag_outlined, () {})
          ])
        ],
      ),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 250,
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: controller,
              children: List.generate(
                6,
                (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/product.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 12),
            child: Row(
              children: [
                Container(
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
                      letterSpacing: 0.8,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor("#7D38A5"),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Часто покупаете?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 6,
            effect: SlideEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: HexColor("#D0D4D3"),
              activeDotColor: HexColor("#051320"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(color: HexColor("#F2F3F7")),
            child: Row(
              children: [
                Icon(Icons.train_outlined, color: HexColor("#7D8087")),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Доступно 2 варианта доставки",
                    style: TextStyle(
                      color: HexColor("#7D8087"),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 18, right: 18, top: 6),
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
            padding: EdgeInsets.only(left: 18, right: 18, top: 2),
            width: double.infinity,
            child: Text("OZON"),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  "14 990 P",
                  style: TextStyle(
                    color: HexColor("#BC3061"),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "14 990 P",
                    style: TextStyle(
                      color: HexColor("#2A1C28"),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: HexColor("#BC3061"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: InkWell(
              onTap: () => {},
              child: Container(
                padding: EdgeInsets.only(left: 18),
                child: Column(
                  children: [
                    Divider(height: 5, color: HexColor("#D7D7D7")),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Нашли дешевле?",
                              style: TextStyle(color: HexColor("#000307")),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.chevron_right,
                              color: HexColor("#D2D6D5"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 5, color: HexColor("#D7D7D7")),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, bottom: 2, left: 18, right: 18),
            child: Text(
              "Pampers",
              style: TextStyle(color: HexColor("#255387")),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(right: 18, left: 18),
            child: Text(
              "Подгузники-трусики Pampers Premium Core 9-15 кг, размер 4, 76 шт",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: HexColor("#061721"),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(right: 18, top: 20, left: 18),
            child: Text("Размер подгузника"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 18, right: index == 19 ? 18 : 0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => {
                    setState(() {
                      isSize = index;
                    })
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: HexColor(
                          isSize == index ? "#104EB1" : "#F4F4F4",
                        ),
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${index + 1} месяц",
                          style: TextStyle(
                            color: HexColor("#010409"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.only(left: 18, top: 4, bottom: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: HexColor("#1B57B9"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Узнать о снижении цены",
                      style: TextStyle(color: HexColor("#061721")),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.only(left: 18, top: 4, bottom: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: HexColor("#00080F"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "В наличии",
                      style: TextStyle(color: HexColor("#00080F")),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 50),
            child: Divider(height: 5, color: HexColor("#D9D9D9")),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            width: double.infinity,
            child: RaisedButton(
              highlightElevation: 1,
              elevation: 0,
              color: HexColor("#F2F3F5"),
              onPressed: () => {},
              child: Text(
                "Купить в 1 клик",
                style: TextStyle(
                  color: HexColor("#1856C5"),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.only(left: 18, top: 4, bottom: 4),
              child: Row(
                children: [
                  Icon(Icons.score_outlined),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text.rich(
                      TextSpan(
                        text: "135 баллов (5%) при оплате c ",
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Ozon Card',
                            style: TextStyle(color: HexColor("#3B4F94")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 10),
            width: double.infinity,
            child: Text(
              "Доставит OZON",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: HexColor("#0C1E28"),
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Москва",
                          style: TextStyle(color: HexColor("#071216")),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.chevron_right,
                          color: HexColor("#849199"),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 53, top: 8),
                    child: Divider(
                      height: 0,
                      color: HexColor("#DADADA"),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.directions_car_outlined,
                          color: HexColor("#0C1E28"),
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Курьером, завтра, 7 января",
                          style: TextStyle(color: HexColor("#071216")),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 53, top: 8),
                    child: Divider(
                      height: 0,
                      color: HexColor("#DADADA"),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.storefront_outlined,
                          color: HexColor("#0C1E28"),
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Самовывоз, завтра, 7 января бесплато",
                          style: TextStyle(color: HexColor("#071216")),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 53, top: 8),
                    child: Divider(
                      height: 0,
                      color: HexColor("#DADADA"),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 45,
            child: TabBar(
              controller: _tabController,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Описание'.toUpperCase()),
                Tab(text: 'Характеристики'.toUpperCase()),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: [
              Container(
                child: RichText(
                  // overflow: TextOverflow.ellipsis,
                  // maxLines: 8,
                  // softWrap: false,
                  text: TextSpan(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and  has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                        text: ' Ещё',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate to desired screen
                          },
                      )
                    ],
                  ),
                ),
              ),
              Column(children: [Text('second tab')]),
            ][_tabIndex],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          ProductCardsWidget(
            title: "Рекомендуемые промо-товары",
            count: 3,
            named: true,
            list: true,
          ),
          ProductCardsWidget(
            title: "Рекомендуем также",
            count: 3,
            named: true,
            list: true,
          ),
          Container(
            decoration: BoxDecoration(color: HexColor("#F2F4F3")),
            padding: EdgeInsets.all(15),
          )
        ],
      ),
    );
  }

  Widget _getFooter() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: HexColor("#DED7DF"), width: 1)),
      ),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: RaisedButton(
          color: HexColor("#005BFE"),
          textColor: Colors.white,
          onPressed: () => {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "В корзину",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text("599 P"),
            ],
          ),
        ),
      ),
    );
  }

  Widget __getAppBarButton(IconData icon, Function onTap,
      {color = Colors.black}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(icon, color: color),
      ),
    );
  }
}
