import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: MyColors.white,
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
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  height: 42,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Искать...',
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 10),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.black45,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 50,
                        minHeight: 10,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => {
                          // _controller.clear()
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black45,
                        ),
                      ),
                      fillColor: Colors.white30,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16)
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) => index == 0 || index == 5
              ? Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 25,
                    bottom: 15,
                  ),
                  child: Text(
                    index == 0 ? "История" : "Популярные",
                    style: TextStyle(
                      color: MyColors.blueCharcoal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : InkWell(
                  onTap: () => {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(
                                Icons.search,
                                color: MyColors.regentGray,
                                size: 28,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Пазл",
                                style: TextStyle(color: MyColors.firefly),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.chevron_right,
                                color: MyColors.regentGray,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 53, top: 8),
                          child: Divider(
                            height: 0,
                            color: MyColors.alto,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
