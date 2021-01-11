import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/widgets/favorite_card_widget.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String selected = "a";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0, 0),
          child: Container(
            child: Text(
              "Избранное",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Divider(height: 1.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return Dialog(
                                  child: Container(
                                    height: 250,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              selected == "1";
                                              setState(() {});
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: new Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 10, 10),
                                                      child: Text(
                                                        "Сначала новые",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10, 10, 10),
                                                    child: Visibility(
                                                      child: new Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                      visible: selected == "1",
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              selected = "2";
                                              setState(() {});
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: new Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 10, 10),
                                                      child: Text(
                                                        "Сначала стары",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10, 10, 10),
                                                    child: Visibility(
                                                      child: new Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                      visible: selected == "2",
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              selected = "3";
                                              setState(() {});
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: new Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 10, 10),
                                                      child: Text(
                                                        "Сначала дешёвые",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10, 10, 10),
                                                    child: Visibility(
                                                      child: new Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                      visible: selected == "3",
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              selected = "4";
                                              setState(() {});
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: new Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 10, 10),
                                                      child: Text(
                                                        "Сначала дорогие",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10, 10, 10),
                                                    child: Visibility(
                                                      child: new Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                      visible: selected == "4",
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              selected = "5";
                                              setState(() {});
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: new Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 10, 10),
                                                      child: Text(
                                                        "По размеру скидки",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10, 10, 10),
                                                    child: Visibility(
                                                      child: new Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                      visible: selected == "5",
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                            });
                      },
                      child: new Expanded(
                          child: new Row(
                        children: <Widget>[
                          new Text("Cначала новые"),
                          new Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.black,
                            size: 36.0,
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
                SizedBox(width: 140),
                Icon(
                  Icons.filter_alt,
                  color: Colors.black,
                  size: 20.0,
                ),
                Text(
                  "Фильтры",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Wrap(
                  children: List.generate(
                      7,
                      (index) => Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: FavoriteCardWidget())),
                )))
      ],
    );
  }

  Padding itemView() => Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      );
}
