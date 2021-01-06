import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final controller = PageController(viewportFraction: 1);

  bool isFavorite = false;
  int isSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              _getAppBarButton(Icons.share, () => {}),
              _getAppBarButton(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                () => {
                  setState(() {
                    isFavorite = !isFavorite;
                  })
                },
                color: HexColor(isFavorite ? "#F61255" : "#000000"),
              ),
              _getAppBarButton(Icons.shopping_bag_outlined, () => {})
            ])
          ],
        ),
      ),
      body: _getCategory(),
    );
  }

  Widget _getCategory() {
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
          Container(
            padding: EdgeInsets.only(left: 18, top: 3),
            child: Row(
              children: [
                Icon(Icons.notifications_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("fdf"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAppBarButton(IconData icon, Function onTap,
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
