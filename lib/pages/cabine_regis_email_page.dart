import 'package:flutter/material.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';

class CabinetPageRegistrationEmail extends StatefulWidget {
  @override
  _CabinetPageRegistrationEmailState createState() => _CabinetPageRegistrationEmailState();
}

class _CabinetPageRegistrationEmailState extends State<CabinetPageRegistrationEmail> {
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
               Align(
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                     child: Text("Только для зарегистрированных пользователей"),
                   ),
               alignment: Alignment.topLeft,
               ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 243, 245, 1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                          child: Text(
                            "Телефон",
                            style: TextStyle(
                              color: !chech_phone_number
                                  ? Colors.black38
                                  : Colors.red,
                            ),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: TextField(
                            controller: _userPhoneNumber,
                            keyboardType: TextInputType.number,
                            onChanged: (string) {},
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 0, 16.0, 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: chech_phone_number ? Text("Некорректный формат телефона", style: TextStyle(color: Colors.red),) : SizedBox(height: 1.0,)),
                ),
            Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                  child: SizedBox(
                    width:  double.infinity,
                    height: 50.0,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
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
                child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("Вернуться на главный экран", style: TextStyle(color: Colors.blue),)),
              ),
            ),)
          ]
      ),
    );
  }
}
