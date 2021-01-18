

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/pages/cabinet_about_app_page.dart';
import 'package:flutter_marketplace/pages/cabinet_account_security_page.dart';
import 'package:flutter_marketplace/pages/cabinet_help_page.dart';
import 'package:flutter_marketplace/pages/cabinet_registration_page.dart';
import 'package:flutter_marketplace/pages/cart_page_search.dart';
import 'package:flutter_marketplace/provider/cabinet_help_provider.dart';
import 'package:provider/provider.dart';

class CabinetProvider extends ChangeNotifier{

  openRegistrationScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CabinetPageRegistration()),
    );
  }

  listItemLocation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartSearch()),
    );
  }

  accountSecurity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountSecurity()),
    );
  }

  aboutApp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutApp()),
    );
  }

  helpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
          create: (context) => CabinetHelpProvider(),
          child: CabinetHelpPage())),
    );
  }


}