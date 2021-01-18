import 'package:flutter/material.dart';

class CabinetHelpDriverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){Navigator.pop(context);},),
        title: Text("Доставка", style: TextStyle(color: Colors.black),),
      ),
      body: Container(
          color: Colors.white,
          child:  ListView(
            children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    title: Text('Где мой заказ'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  ListTile(
                    title: Text('Стоимость доставки'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  ListTile(
                    title: Text('Перенести время доставки'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  ListTile(
                    title: Text('Продлить срок хранения'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  ListTile(
                    title: Text('Нет нужного способа доставки'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  ListTile(
                    title: Text('Способы доставки'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),


                ]
            ).toList(),
          )
      ),
    );
  }

}
