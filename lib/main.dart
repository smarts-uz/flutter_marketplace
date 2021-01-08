import 'package:flutter/material.dart';
import 'package:flutter_marketplace/layouts/home_layout.dart';
import 'package:flutter_marketplace/pages/product_page.dart';
import 'package:flutter_marketplace/pages/search_page.dart';

import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _title = "Marketplace Demo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeLayout(title: _title),
        '/product': (context) => ProductPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/search":
            return PageRouteBuilder(pageBuilder: (_, __, ___) => SearchPage());

          default:
            return null;
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // fontFamily: "CascadiaCode",
      ),
    );
  }
}
