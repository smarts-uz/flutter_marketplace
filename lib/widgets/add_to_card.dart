import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddToCardWidget extends StatefulWidget {
  @override
  _AddToCardWidgetState createState() => _AddToCardWidgetState();
}

class _AddToCardWidgetState extends State<AddToCardWidget> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Add to Card",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.close,
                        size: 20,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: EdgeInsets.only(top: 10, bottom: 8, left: 10),
                          child: Text(
                            "HP Laptop 307",
                            style: TextStyle(fontSize: 15),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, bottom: 5, left: 20),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            children: [
                              Container(
                                height: 13,
                                width: 25,
                                // padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 0, right: 5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "lib/assets/img/Rectangle.png"),
                                      fit: BoxFit.cover),
                                ),
                                child: Center(
                                  child: Text(
                                    "4.7",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                              Text(
                                "51 отзывов",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5, left: 20),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "800 000 сум",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5, left: 20),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "800 000 сум",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, bottom: 5, left: 20),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            children: [
                              Text("Shipd from:",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              Container(
                                child: Image(
                                    image: AssetImage(
                                        "lib/assets/img/mediaPark.png"),
                                    fit: BoxFit.cover),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            height: 100,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                    child: Image(
                                        image: AssetImage(
                                            'lib/assets/img/notebook.png')));
                              },
                            );
                          }).toList(),
                        ),
                        // buttonCarouselController.jumpToPage(2),
                        // Radio(
                        //   value: 0,
                        //   groupValue: _carouselRadio,
                        //   onChanged: _handleRadioValueChange1,
                        // ),
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
