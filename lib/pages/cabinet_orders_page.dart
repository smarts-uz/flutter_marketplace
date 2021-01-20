import 'package:flutter/material.dart';


class CabinetOrderPage extends StatefulWidget {
  @override
  _CabinetOrderPageState createState() => _CabinetOrderPageState();
}

class _CabinetOrderPageState extends State<CabinetOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back), color: Colors.black, onPressed: (){Navigator.pop(context);},),
        title: Text("Заказы", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
