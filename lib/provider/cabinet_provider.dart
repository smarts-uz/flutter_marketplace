

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/pages/cabinet_registration_page.dart';

class CabinetProvider extends ChangeNotifier{

  openRegistrationScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CabinetPageRegistration()),
    );
  }
}