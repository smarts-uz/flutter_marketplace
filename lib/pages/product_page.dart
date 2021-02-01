import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/config/colors.dart';

import 'package:flutter_marketplace/widgets/product_cards_widget.dart';
import 'package:flutter_marketplace_service/service/product/cubit/product_cubit.dart';
import 'package:flutter_marketplace_service/service/product/product_repository.dart';
import 'package:shimmer/shimmer.dart';
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

  final productRepository = ProductRepository();

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
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit(productRepository)..getAll(2),
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: _getAppBar(),
        body:
            BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
          if (state is ProductInitial || state is ProductLoadingState) {
            return Shimmer.fromColors(
              baseColor: MyColors.shimmerBaseColor,
              highlightColor: MyColors.shimmerHighlightColor,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  height: 150,
                  aspectRatio: 1,
                  enlargeCenterPage: true,
                ),
                items: List.generate(
                  3,
                  (_) => Container(
                    width: double.infinity,
                    color: MyColors.white,
                  ),
                ),
              ),
            );
          } else if (state is ProductLoadedState) {
            return _getBody();
          } else if (state is ProductErrorState) {
            return Center(
              child: Text("Error"),
            );
          } else {
            return Container();
          }
        }),
        bottomNavigationBar: _getFooter(),
      ),
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
              color: isFavorite ? MyColors.redRibbon : MyColors.black,
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
                    color: MyColors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "—40%",
                    style: TextStyle(
                      color: MyColors.white,
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
                    color: MyColors.royalPurple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Часто покупаете?",
                    style: TextStyle(
                      color: MyColors.white,
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
              dotColor: MyColors.tiara,
              activeDotColor: MyColors.blackPearl,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(color: MyColors.athensGray),
            child: Row(
              children: [
                Icon(Icons.train_outlined, color: MyColors.raven),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Доступно 2 варианта доставки",
                    style: TextStyle(
                      color: MyColors.raven,
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
                color: MyColors.sorrellBrown,
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
                    color: MyColors.hibiscus,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "14 990 P",
                    style: TextStyle(
                      color: MyColors.thunder,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: MyColors.hibiscus,
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
                    Divider(height: 5, color: MyColors.alto),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Нашли дешевле?",
                              style: TextStyle(color: MyColors.blueCharcoal),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.chevron_right,
                              color: MyColors.tiara,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 5, color: MyColors.alto),
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
              style: TextStyle(color: MyColors.stTropaz),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(right: 18, left: 18),
            child: Text(
              "Подгузники-трусики Pampers Premium Core 9-15 кг, размер 4, 76 шт",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: MyColors.blackPearl,
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
                        color: isSize == index
                            ? MyColors.toryBlue
                            : MyColors.wildSand,
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
                            color: MyColors.blackPearl,
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
                    color: MyColors.denim,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Узнать о снижении цены",
                      style: TextStyle(color: MyColors.blackPearl),
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
                    color: MyColors.blueCharcoal,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "В наличии",
                      style: TextStyle(color: MyColors.blueCharcoal),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 50),
            child: Divider(height: 5, color: MyColors.alto),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            width: double.infinity,
            child: RaisedButton(
              highlightElevation: 1,
              elevation: 0,
              color: MyColors.athensGray,
              onPressed: () => {},
              child: Text(
                "Купить в 1 клик",
                style: TextStyle(
                  color: MyColors.denim,
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
                            style: TextStyle(color: MyColors.chambray),
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
                          color: MyColors.firefly,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Москва",
                          style: TextStyle(color: MyColors.firefly),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.chevron_right,
                          color: MyColors.regentGray,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 53, top: 8),
                    child: Divider(
                      height: 0,
                      color: MyColors.alto,
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
                          color: MyColors.firefly,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Курьером, завтра, 7 января",
                          style: TextStyle(color: MyColors.firefly),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 53, top: 8),
                    child: Divider(
                      height: 0,
                      color: MyColors.alto,
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
                          color: MyColors.firefly,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Самовывоз, завтра, 7 января бесплато",
                          style: TextStyle(color: MyColors.firefly),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 53, top: 8),
                    child: Divider(
                      height: 0,
                      color: MyColors.alto,
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
            perCol: 3,
          ),
          ProductCardsWidget(
            title: "Рекомендуем также",
            count: 3,
            named: true,
            list: true,
            perCol: 3,
          ),
          Container(
            decoration: BoxDecoration(color: MyColors.blackHaze),
            padding: EdgeInsets.all(15),
          )
        ],
      ),
    );
  }

  Widget _getFooter() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: MyColors.mischka, width: 1)),
      ),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: RaisedButton(
          color: MyColors.blue,
          textColor: MyColors.white,
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
