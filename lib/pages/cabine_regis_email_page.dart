import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_service/models/signup_request.dart';
import 'package:flutter_marketplace_service/service/users/cubit/users_cubit.dart';
import 'package:flutter_marketplace_service/service/users/users_repository.dart';

class CabinetPageRegistrationEmail extends StatefulWidget {
  @override
  _CabinetPageRegistrationEmailState createState() =>
      _CabinetPageRegistrationEmailState();
}

class _CabinetPageRegistrationEmailState
    extends State<CabinetPageRegistrationEmail> {
  bool checkEmail = false;
  bool checkName = false;
  bool checkPasspord = false;
  bool checkComfirmPasspord = false;
  final TextEditingController _userEmail = new TextEditingController();
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _comfirmPassword = new TextEditingController();
  String _nameString = "name";
  String _passwordString = "123456";
  String _emailString = "asdasdsa@gm.ru";
  String _comfirmPasswordString = "123456";
  bool _passwordVisible = false;
  bool _comfirmVisible = false;
  double INPUT_HEIGHT = 45;
  double INPUT_SPACE = 10;
  UsersCubit usersCubit = UsersCubit(UsersRepository());
  //
  final scaffoldState = GlobalKey<ScaffoldState>();
  //

  // @override
  // void initState() {
  //   super.initState();

  // }

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
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        backgroundColor: Colors.white,
        body: BlocProvider<UsersCubit>(
          create: (context) => usersCubit,
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is UsersLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UsersLoginLoadedState) {
                Navigator.pop(context);
              }
              if (state is UsersErrorState) {
                return Center(
                  child: Text("Error"),
                );
              }
              return Stack(children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Center(
                          child: Text("Вход или регистрация"),
                        ),
                        Align(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                            child:
                                Text("Только для зарегистрированных пользователей"),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: INPUT_HEIGHT,
                                    child: TextField(
                                      controller: _userName,
                                      keyboardType: TextInputType.name,
                                      onChanged: (string) {},
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Name",
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.black54),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.black54),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: INPUT_SPACE),
                                  Container(
                                    height: INPUT_HEIGHT,
                                    child: TextField(
                                      controller: _userEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (string) {},
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Password",
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.black54),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.black54),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: INPUT_SPACE),
                                  Container(
                                    height: INPUT_HEIGHT,
                                    child: TextFormField(
                                      controller: _password,
                                      keyboardType: TextInputType.text,
                                      onChanged: (string) {},
                                      decoration: new InputDecoration(
                                        filled: true,
                                          suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black38,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                      ),
                                        hintText: "Email",
                                      border: OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.black54),
                                           borderRadius: BorderRadius.circular(25.7),
                                              ),
                                         enabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.black54),
                                         borderRadius: BorderRadius.circular(25.7),
                                          ),
                                         contentPadding: const EdgeInsets.only(
                                         left: 14.0, bottom: 8.0, top: 8.0),
                                         ),
                                      obscureText: !_passwordVisible,
                                    ),
                                  ),
                                  SizedBox(height: INPUT_SPACE),
                                  Container(
                                    color: Colors.white,
                                    height: INPUT_HEIGHT,
                                    child: TextFormField(
                                      controller: _comfirmPassword,
                                      keyboardType: TextInputType.text,
                                      onChanged: (string) {},
                                      decoration: new InputDecoration(
                                        hintText: "Confirm Passpord",
                                          filled: true,
                                          suffixIcon: IconButton(
                                        icon: Icon(
                                          _comfirmVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black38,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _comfirmVisible = !_comfirmVisible;
                                          });
                                        },
                                      ),
                                    border: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.black54),
                                    borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.black54),
                                    borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),

                                      ),
                                      obscureText: !_comfirmVisible,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(24.0, 0, 16.0, 0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: (checkEmail ||
                                      checkName ||
                                      checkPasspord ||
                                      checkPasspord ||
                                      checkComfirmPasspord)
                                  ? Text(
                                      "Данные не заполнены",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : SizedBox(
                                      height: 1.0,
                                    )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Вернуться на главный экран",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                  ),
                )
              ]);
            },
          ),
        ),
      ),
    );
  }

  void onPress() {
    if (_nameString == "") {
      // || _passwordString == "" || _emailString == "" || _comfirmPasswordString == ""){
      checkName = true;
      print("ok nameString");
    }
    if (_passwordString == "") {
      checkPasspord = true;
      print("Ok passwordString");
    }
    if (_emailString == "") {
      checkEmail = true;
    }
    if (_comfirmPasswordString == "") {
      checkComfirmPasspord = true;
    }
    if (checkName || checkEmail || checkPasspord || checkComfirmPasspord) {
      //  data not filled
    } else {
      print("ok");
      usersCubit.signup(SignupRequest(
          name: _nameString,
          email: _emailString,
          password: _passwordString,
          passowrdConfirmation: _comfirmPasswordString));
    }
    onChanged();
  }

  void onChanged() {
    setState(() {});
  }
}
