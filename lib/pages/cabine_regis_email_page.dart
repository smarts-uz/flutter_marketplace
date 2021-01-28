import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/extensions/hex_color.dart';
import 'package:flutter_marketplace_service/models/signup_request.dart';
import 'package:flutter_marketplace_service/service/users/cubit/users_cubit.dart';
import 'package:flutter_marketplace_service/service/users/users_repository.dart';

class CabinetPageRegistrationEmail extends StatefulWidget {
  @override
  _CabinetPageRegistrationEmailState createState() => _CabinetPageRegistrationEmailState();
}

class _CabinetPageRegistrationEmailState extends State<CabinetPageRegistrationEmail> {
  bool check_email = false;
  bool check_name = false;
  bool check_passpord = false;
  bool check_comfirmpasspord = false;
  final TextEditingController _userEmail = new TextEditingController();
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _comfirmPassword = new TextEditingController();
  String _nameString = "";
  String _passwordString = "";
  String _emailString = "";
  String _comfirmPasswordString = "";
  bool _passwordVisible;
  bool _comfirmVisible;

  UsersCubit usersCubit = UsersCubit(UsersRepository());
  //
  final scaffoldState = GlobalKey<ScaffoldState>();
  //


  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _comfirmVisible = false;
  }

  _CabinetPageRegistrationEmailState() {
    _userName.addListener(_nameListen);
    _userEmail.addListener(_emailListen);
    _password.addListener(_passwordListen);
    _comfirmPassword.addListener(_comfirmPasswordListen);
  }

  void _nameListen() {
    if (_userName.text.isEmpty) {
      _nameString = "";
    } else {
      _nameString = _userName.text;
    }
  }

  void _passwordListen() {
    if (_password.text.isEmpty) {
      _passwordString = "";
    } else {
      _passwordString = _password.text;
    }
  }

  void _comfirmPasswordListen() {
    if (_comfirmPassword.text.isEmpty) {
      _comfirmPasswordString = "";
    } else {
      _comfirmPasswordString = _comfirmPassword.text;
    }
  }

  void _emailListen() {
    if (_userEmail.text.isEmpty) {
      _emailString = "";
    } else {
      _emailString = _userEmail.text;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: BlocProvider<UsersCubit>(
        create: (context) => usersCubit,
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state){
            if (state is UsersLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is UsersLoginLoadedState){
              Navigator.pop(context);
            }
            if(state is UsersErrorState){
              return Center(
                child: Text("Error"),
              );
            }
            return Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
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
                                    "Name",
                                    style: TextStyle(
                                      color: !check_name
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
                                    controller: _userName,
                                    keyboardType: TextInputType.name,
                                    onChanged: (string) {},
                                  ),
                                ),
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                      color: !check_email
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
                                    controller: _userEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (string) {},
                                  ),
                                ),
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                                  child: Text(
                                    "Passpord",
                                    style: TextStyle(
                                      color: !check_passpord
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
                                  child: TextFormField(
                                    controller: _password,
                                    keyboardType: TextInputType.text,
                                    onChanged: (string) {},
                                    decoration: new InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _passwordVisible ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.black38,
                                          ),
                                          onPressed: (){
                                            setState(() {
                                              _passwordVisible = !_passwordVisible;
                                            });
                                          },
                                        )
                                    ),
                                    obscureText: !_passwordVisible,
                                  ),
                                ),
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                                  child: Text(
                                    "Confirm Passpord",
                                    style: TextStyle(
                                      color: ! check_comfirmpasspord
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
                                  child: TextFormField(
                                    controller: _comfirmPassword,
                                    keyboardType: TextInputType.text,
                                    onChanged: (string) {},
                                    decoration: new InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _comfirmVisible ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.black38,
                                          ),
                                          onPressed: (){
                                            setState(() {
                                              _comfirmVisible = !_comfirmVisible;
                                            });
                                          },
                                        )
                                    ),
                                    obscureText: !_comfirmVisible,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(24.0, 0, 16.0, 0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: (check_email || check_name || check_passpord || check_passpord || check_comfirmpasspord) ? Text("Данные не заполнены", style: TextStyle(color: Colors.red),) : SizedBox(height: 1.0,)),
                        ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            color: Color.fromRGBO(0, 91, 254, 1),
                            onPressed: () {
                              onPress();
                            },
                            child: Text(
                              "Регистрация",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                    ),
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
            );
  },
        ),
      ),
    );
  }

  void onPress() {
    if(_nameString == "") { // || _passwordString == "" || _emailString == "" || _comfirmPasswordString == ""){
      check_name = true;
      print("ok nameString");
    }
    if(_passwordString == ""){
      check_passpord = true;
      print("Ok passwordString");
    }
    if(_emailString == ""){
      check_email = true;
    }
    if(_comfirmPasswordString == ""){
      check_comfirmpasspord = true;
    }
    if(check_name || check_email || check_passpord || check_comfirmpasspord){
    //  data not filled
    }
    else {
      print("ok");
      usersCubit.signup(SignupRequest(
        name: _nameString,
        email: _emailString,
        password: _passwordString,
        passowrdConfirmation: _comfirmPasswordString
      ));
    }
    onChanged();
  }

  void onChanged(){
    setState(() {
    });
  }
}
