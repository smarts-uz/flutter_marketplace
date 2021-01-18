import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/pages/cabinet_help_driver_page.dart';

class CabinetHelpProvider extends ChangeNotifier{

  void cabinetHelpDriver(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CabinetHelpDriverPage()),
    );
  }

}