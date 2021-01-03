import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace/pages/cabinet_page.dart';
import 'package:flutter_marketplace/pages/cart_page.dart';
import 'package:flutter_marketplace/pages/catalog_page.dart';
import 'package:flutter_marketplace/pages/favorite_page.dart';
import 'package:flutter_marketplace/pages/home_page.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 42,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => {},
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  icon: Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Поиск',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      fillColor: Colors.white30,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => {},
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  icon: Icon(
                    Icons.mic,
                    color: Colors.black54,
                  ),
                ),
                IconButton(
                  onPressed: () => {},
                  padding: EdgeInsets.only(right: 10),
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => HomePage();
              break;
            case '/catalog':
              builder = (BuildContext context) => CatalogPage();
              break;
            case '/cart':
              builder = (BuildContext context) => CartPage();
              break;
            case '/fovarite':
              builder = (BuildContext context) => FavoritePage();
              break;
            case '/cabinet':
              builder = (BuildContext context) => CabinetPage();
              break;
            default:
              builder = (BuildContext context) => HomePage();
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: HexColor("#12185C"),
        selectedIconTheme: IconThemeData(size: 26),
        unselectedItemColor: HexColor("#999999"),
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
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
