import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/pages/cart_page_search.dart';

class CartProvider extends ChangeNotifier{

    openSearchScreen(BuildContext context){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartSearch()),
      );
    }
}