import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/utils/colors.dart';
import 'package:flutter_marketplace/pages/cabinet_page.dart';
import 'package:flutter_marketplace/pages/cart_page.dart';
import 'package:flutter_marketplace/pages/catalog_page.dart';
import 'package:flutter_marketplace/pages/favorite_page.dart';
import 'package:flutter_marketplace/pages/home_page.dart';
import 'package:flutter_marketplace/provider/cabinet_provider.dart';
import 'package:flutter_marketplace/provider/cart_provider.dart';
import 'package:flutter_marketplace_service/service/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_marketplace_service/service/wishlist/wishlist_api_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  String resultText = "";

  int _curentIndex = 0;

  @override
  void initState() {
    _changeSysBar();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _changeSysBar() {
    Color color = _curentIndex > 1 ? MyColors.white : MyColors.bigStone;

    FlutterStatusbarcolor.setStatusBarColor(color).then(
      (value) {
        bool isWhite = useWhiteForeground(color);
        FlutterStatusbarcolor.setStatusBarWhiteForeground(isWhite);
      },
    );
  }

  // _speechTotext() {
  //   print(_isAvailable.toString() + ' ' + _isListening.toString());
  //   if (_isListening)
  //     _speechRecognition.stop().then(
  //           (result) => setState(() {
  //             _isListening = result;
  //             resultText = "";
  //           }),
  //         );
  //   if (_isAvailable && !_isListening) {
  //     _speechRecognition.listen(locale: "ru_RU").then((result) {
  //       setState(() {
  //         resultText = result;
  //         print(resultText + " ok Google");
  //       });
  //     });
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        toolbarHeight: _curentIndex > 1 ? 0 : 56,
        titleSpacing: 0,
        elevation: _curentIndex > 2 ? 0 : 1,
        backgroundColor: _curentIndex > 1 ? MyColors.white : MyColors.bigStone,
        title: Container(
          height: 42,
          child: Row(
            children: [
              SizedBox(width: 16),
              // Container(
              //   width: 40,
              //   margin: EdgeInsets.only(left: 7, right: 8),
              //   child: InkWell(
              //     borderRadius: BorderRadius.circular(50),
              //     onTap: () => {
              //       // Get.toNamed("/search")
              //     },
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
              //       child: Text(""),
              //       // Text(
              //       //   "anti virus".toUpperCase(),
              //       //   style: TextStyle(color: MyColors.white, fontSize: 9),
              //       //   overflow: TextOverflow.ellipsis,
              //       //   maxLines: 2,
              //       //   softWrap: false,
              //       //   textAlign: TextAlign.center,
              //       // ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: InkWell(
                  onTap: () => {Get.toNamed("/search")},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: MyColors.white,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => {Get.toNamed("/search")},
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          icon: Icon(Icons.search, color: Colors.black45),
                        ),
                        Expanded(
                          child: Text(
                            "Искать...",
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        // SizedBox(
                        //   width: 35,
                        //   child: IconButton(
                        //     padding: EdgeInsets.all(0),
                        //     onPressed: () => {
                        //       _speechTotext(),
                        //     },
                        //     icon: Icon(
                        //       Icons.mic_none_outlined,
                        //       color: MyColors.bigStone,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 35,
                        //   child: IconButton(
                        //     padding: EdgeInsets.all(0),
                        //     onPressed: () => {},
                        //     icon: Icon(
                        //       Icons.camera_alt_outlined,
                        //       color: MyColors.bigStone,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(width: 10)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16)
            ],
          ),
        ),
      ),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
                settings: settings,
              );
            case '/catalog':
              return MaterialPageRoute(
                builder: (BuildContext context) => CatalogPage(),
                settings: settings,
              );
            case '/cart':
              return MaterialPageRoute(
                builder: (BuildContext context) => ChangeNotifierProvider(
                  create: (context) => CartProvider(),
                  child: CartPage(),
                ),
                settings: settings,
              );
            case '/fovarite':
              return MaterialPageRoute(
                builder: (BuildContext context) => BlocProvider(
                    create: (context) => WishlistBloc(
                        wishlistApiProvider: WishlistApiProvider()),
                    child: FavoritePage()),
                settings: settings,
              );
            case '/cabinet':
              return MaterialPageRoute(
                builder: (BuildContext context) => ChangeNotifierProvider(
                    create: (context) => CabinetProvider(),
                    child: CabinetPage()),
                settings: settings,
              );
            // case '/in_catalog':
            //   return MaterialPageRoute(
            //     builder: (BuildContext context) => InCatalogPage(),
            //     settings: settings,
            //   );
            default:
              return null;
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyColors.toryBlue,
        selectedIconTheme: IconThemeData(size: 26),
        unselectedItemColor: MyColors.dustyGray,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        currentIndex: _curentIndex,
        onTap: (index) {
          if (index == _curentIndex) return;

          String page = '';

          switch (index) {
            case 1:
              page = 'catalog';
              break;
            case 2:
              page = 'cart';
              break;
            case 3:
              page = 'fovarite';
              break;
            case 4:
              page = 'cabinet';
              break;
          }

          _navigatorKey.currentState.pushNamed("/$page");

          setState(() {
            _curentIndex = index;

            Future.delayed(Duration(milliseconds: 200), () {
              _changeSysBar();
            });
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: "Каталог",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Корзина",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Избранное",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Кабинет",
          ),
        ],
      ),
    );
  }
}
