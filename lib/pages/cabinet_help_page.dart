import 'package:flutter/material.dart';
import 'package:flutter_marketplace/provider/cabinet_help_provider.dart';
import 'package:provider/provider.dart';

class CabinetHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CabinetHelpProvider myProvider =
        Provider.of<CabinetHelpProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Помощь",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              leading: Icon(
                Icons.drive_eta,
                color: Colors.blue,
              ),
              title: Text('Доставка'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                myProvider.cabinetHelpOpenScreen(context, 0);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.note,
                color: Colors.blue,
              ),
              title: Text('Редактирование заказа'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                myProvider.cabinetHelpOpenScreen(context, 1);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Colors.blue,
              ),
              title: Text('Оплата'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                myProvider.cabinetHelpOpenScreen(context, 2);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.cancel,
                color: Colors.blue,
              ),
              title: Text('Что-то не так с товаром'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                myProvider.cabinetHelpOpenScreen(context, 3);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.create,
                color: Colors.blue,
              ),
              title: Text('Неполучается сделать заказ'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                myProvider.cabinetHelpOpenScreen(context, 4);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.cloud_queue_sharp,
                color: Colors.blue,
              ),
              title: Text('Рассрочка Ashop'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                myProvider.cabinetHelpOpenScreen(context, 5);
              },
            ),
          ]).toList(),
        ),
      ),
    );
  }
}
