import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace/pages/cabinet_page.dart';
import 'package:flutter_marketplace/pages/cart_page.dart';
import 'package:flutter_marketplace/pages/catalog_page.dart';
import 'package:flutter_marketplace/pages/favorite_page.dart';
import 'package:flutter_marketplace/pages/home_page.dart';
import 'package:flutter_marketplace/provider/cart_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  int _curentIndex = 0;
  bool _isHideAppBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: _isHideAppBar ? 0 : 56,
        titleSpacing: 0,
        backgroundColor: HexColor("#102030"),
        title: Container(
          height: 42,
          child: Row(
            children: [
              Container(
                width: 40,
                margin: EdgeInsets.only(left: 7, right: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => {
                    // Get.toNamed("/search")
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                    child: Text(
                      "anti virus".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 9),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => {Get.toNamed("/search")},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
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
                        SizedBox(
                          width: 35,
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => {},
                            icon: Icon(
                              Icons.mic_none_outlined,
                              color: HexColor("#102030"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: HexColor("#102030"),
                            ),
                          ),
                        ),
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
                    child: CartPage()),
                settings: settings,
              );
            case '/fovarite':
              return MaterialPageRoute(
                builder: (BuildContext context) => FavoritePage(),
                settings: settings,
              );
            case '/cabinet':
              return MaterialPageRoute(
                builder: (BuildContext context) => CabinetPage(),
                settings: settings,
              );
            default:
              return null;
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: HexColor("#154BB7"),
        selectedIconTheme: IconThemeData(size: 26),
        unselectedItemColor: HexColor("#999999"),
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
          bool hideAppBar = false;

          switch (index) {
            case 1:
              page = 'catalog';
              break;
            case 2:
              hideAppBar = true;
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
            _isHideAppBar = hideAppBar;
            _curentIndex = index;
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
