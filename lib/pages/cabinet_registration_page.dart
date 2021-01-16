import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';

class CabinetPageRegistration extends StatefulWidget {
  @override
  _CabinetPageRegistrationState createState() => _CabinetPageRegistrationState();
}

class _CabinetPageRegistrationState extends State<CabinetPageRegistration> {
 bool chech_phone_number = false;
 final TextEditingController _userPhoneNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.close),
                    onPressed: (){Navigator.pop(context);},
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Center(child: Text("Вход или регистрация"),),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242,243,245, 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Телефон", style: TextStyle(color: !chech_phone_number ? Colors.black26 : Colors.red),)),
                        ),
                        TextField(
                          controller: _userPhoneNumber,
                          keyboardType: TextInputType.number,
                          onChanged: (string){
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: chech_phone_number ? Text("Некорректный формат телефона", style: TextStyle(color: Colors.red),) : SizedBox(height: 1.0,)),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: SizedBox(
                  width:  double.infinity,
                  height: 50.0,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Color.fromRGBO(0,91,254, 1), onPressed:() {
                       setState(() {
                           if(_userPhoneNumber.text == ""){
                             chech_phone_number = true;
                           }
                       });
                      },
                      child: Text( "Получить код", style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold),)),
                ),
              ),

            ],
          ),
          Positioned( child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Text("Войти по почте", style: TextStyle(color: Colors.blue),),
            ),
          ),)
        ]
      ),
    );
  }
}
