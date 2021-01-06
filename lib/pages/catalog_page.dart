import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return _getCategory();
  }

  Widget _getCategory() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Wrap(
        children: List.generate(
          20,
          (index) => InkWell(
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 6),
                    height: 75,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        child: Image.asset(
                          'assets/catalog.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    width: double.infinity,
                    child: Text(
                      "Шоколад и сладости asda dsfsdf sfsdfsd sdfsdfsfs sdfsdf",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#131C19"),
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
    );
  }
}
