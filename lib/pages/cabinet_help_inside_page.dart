import 'package:flutter/material.dart';
import 'package:flutter_marketplace/provider/cabinet_help_inside_provider.dart';
import 'package:provider/provider.dart';

class CabinetHelpDriverPage extends StatelessWidget {
  final List<String> list;
  final String appbar_title;

  CabinetHelpDriverPage({this.list, this.appbar_title});
  CabinetHelpInsideProvider myProvider;


  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<CabinetHelpInsideProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){Navigator.pop(context);},),
        title: Text(appbar_title, style: TextStyle(color: Colors.black),),
      ),
      body: Container(
          color: Colors.white,
          child:  ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return ListTile(
                title: Text(item),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: (){
                  myProvider.openScreen(context, index);
                },
               );
            },
          )
      ),
    );
  }

}

