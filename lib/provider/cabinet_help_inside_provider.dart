

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/pages/cabinet_help_last_page.dart';

class CabinetHelpInsideProvider extends ChangeNotifier {

  void openScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CabinetHelpLastPage()),
    );
  }

}