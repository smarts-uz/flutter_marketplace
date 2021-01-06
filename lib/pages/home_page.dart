import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace_service/flutter_marketplace_service.dart';
import 'package:flutter_marketplace_service/models/users.model.dart';
import 'package:get/get.dart';

// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:infinity_page_view/infinity_page_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.9);
  final categoryController = PageController(viewportFraction: 1);

  String historyTab = "history";
  int _itemCount = 0;
  int _currentBanner = 0;
  int _currentCategory = 0;
  bool _isFavorite = false;

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  List<UserModel> users = [];

  _getUsers() {
    Api.getUsers().then((_users) {
      setState(() {
        users = _users;
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  historyTabToggle({String tab = "history"}) {
    setState(() {
      historyTab = tab;
    });
  }

  Future<Null> _refresh() {
    return Api.getUsers().then((_user) {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _getCarousel(),
          _getCategory(),
          _getBestBeal("Лучшее предложение", 6),
          _getProfitable("Это выгодно! Успей купить!"),
          _getBestBeal("Скидки до 80%", 3),
          _getBanner(),
          _getBestBeal("Новогодняя распродажа", 3),
          _getProfitable("Покупки сезона", isName: true),
          _getBestBeal("Бесплатная доставка по всему миру", 6, isName: true),
          Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }

  Widget _getCarousel() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 150,
              aspectRatio: 1,
              enlargeCenterPage: true,
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
                    'assets/carousel.jpg',
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
                          ? Colors.white
                          : HexColor("#D6D9DE"),
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

  Widget _getCategory() {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCategory = index;
              });
            },
          ),
          items: List.generate(
            2,
            (_) => Wrap(
              runSpacing: 15,
              children: List.generate(
                10,
                (index) => Container(
                  width: MediaQuery.of(context).size.width / 5.6,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 6),
                        height: 55,
                        width: 55,
                        child: InkWell(
                          child: Image.asset(
                            'assets/catalog.png',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        width: double.infinity,
                        child: Text(
                          "Каталог46545sda asda dsfsdf sfsdfsd sdfsdfsfs sdfsdf",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
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
                2,
                (index) => Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor(
                      _currentCategory == index ? "#031835" : "#D6D9DE",
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getBestBeal(String title, int count, {isName: false}) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: HexColor("#16202F"),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: List.generate(
            count,
            (index) => Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 9),
                width: MediaQuery.of(context).size.width / 3.5,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => {Get.toNamed("/product")},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 3, top: 6),
                            height: MediaQuery.of(context).size.width / 3.3,
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
                                    width:
                                        MediaQuery.of(context).size.width / 4.3,
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
                                          : Stack(
                                              children: [
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
                                              ],
                                            )),
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
                                padding: EdgeInsets.symmetric(horizontal: 15),
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
                                padding: EdgeInsets.symmetric(horizontal: 15),
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
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: HexColor("#BC3061"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              isName
                                  ? Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        "Redmia Note 9 Pro Max / Redmi Note 9 Pro",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: _getCounterBtn(index),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getCounterBtn(int index) {
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

  Widget _getProfitable(String title, {isName: false}) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: HexColor("#16202F"),
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
                          ? Colors.white
                          : HexColor("#D6D9DE"),
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
