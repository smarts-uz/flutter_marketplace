import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace/widgets/product_card_widget.dart';

class ProductCardsWidget extends StatefulWidget {
  ProductCardsWidget({
    Key key,
    this.title,
    this.count,
    this.named,
    this.list,
    this.perCol,
  }) : super(key: key);

  final String title;
  final int count;
  final bool named;
  final bool list;
  final double perCol;

  @override
  _ProductCardsWidgetState createState() => _ProductCardsWidgetState();
}

class _ProductCardsWidgetState extends State<ProductCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: HexColor("#16202F"),
          ),
        ),
      ),
      widget.list
          ? Container(
              height: 275,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ProductCardWidget(named: widget.named);
                },
              ),
            )
          : Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(
                widget.count,
                (index) => Container(
                  width: MediaQuery.of(context).size.width / widget.perCol,
                  child: ProductCardWidget(named: widget.named),
                ),
              ),
            )
    ]);
  }
}
