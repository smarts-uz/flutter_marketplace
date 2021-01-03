import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace_service/flutter_marketplace_service.dart';
import 'package:flutter_marketplace_service/models/users.model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:infinity_page_view/infinity_page_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.8);

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

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _getCarusel(),
        _getPopularCategory(),
        _getTodayProducts(),
      ],
    );
  }

  Widget _getCarusel() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 14, bottom: 6),
          height: 200,
          child: PageView(
            physics: BouncingScrollPhysics(),
            controller: controller,
            children: List.generate(
              7,
              (_) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'lib/assets/img/home-carusel.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: SmoothPageIndicator(
            controller: controller,
            count: 6,
            effect: SlideEffect(
              spacing: 5.0,
              dotWidth: 7.0,
              dotHeight: 7.0,
              dotColor: HexColor("#C4C4C4"),
              activeDotColor: HexColor("#3377FF"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPopularCategory() {
    return Column(
      children: [
        _getTitle(title: "Популярные категории"),
        Container(
          margin: EdgeInsets.only(
            top: 10,
            bottom: 6,
          ),
          height: 110,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: PageController(viewportFraction: 0.1),
            children: List.generate(
              7,
              (index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                height: 100,
                width: 100,
                margin: EdgeInsets.only(
                  left: index == 0 ? 18 : 6,
                  top: 6,
                  bottom: 6,
                  right: index == 6 ? 18 : 6,
                ),
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/img/category.png',
                        fit: BoxFit.cover,
                        width: 44,
                        height: 34,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Office supplies",
                        style: TextStyle(
                          color: HexColor("#333333"),
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getTodayProducts() {
    return Column(
      children: [
        _getTitle(title: "Только сегодня", top: 10),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 6),
          height: 230,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: PageController(viewportFraction: 0.1),
            children: List.generate(
              7,
              (index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                height: 230,
                width: 160,
                margin: EdgeInsets.only(
                  left: index == 0 ? 18 : 6,
                  top: 6,
                  bottom: 6,
                  right: index == 6 ? 18 : 6,
                ),
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/img/notebook.png',
                        fit: BoxFit.cover,
                        width: 98,
                        height: 86,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Office supplies",
                        style: TextStyle(
                          color: HexColor("#333333"),
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getTitle({String title, double top = 20.0}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: top, left: 18, right: 18),
      child: Text(
        title,
        style: TextStyle(
          color: HexColor("#333333"),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
