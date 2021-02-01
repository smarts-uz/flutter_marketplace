import 'package:flutter/material.dart';
import 'package:flutter_marketplace/layouts/home_layout.dart';
import 'package:flutter_marketplace/pages/product_page.dart';
import 'package:flutter_marketplace/pages/search_page.dart';
import 'package:catcher/catcher.dart';
import 'package:get/get.dart';

void main() {
  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    HttpHandler(
      HttpRequestType.post,
      Uri.parse("https://httpstat.us/200"),
      printLogs: true,
      enableDeviceParameters: true,
      enableApplicationParameters: true,
      enableStackTrace: true,
    )
  ]);

  Catcher(
      rootWidget: MyApp(),
      debugConfig: debugOptions,
      releaseConfig: releaseOptions);
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
