import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace/sharepreference/share_preference.dart';
import 'package:flutter_marketplace_service/models/signup_request.dart';
import 'package:flutter_marketplace_service/service/users/cubit/users_cubit.dart';
import 'package:flutter_marketplace_service/service/users/users_repository.dart';

class CabinetPageRegistrationEmail extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => screen());

  static Widget screen() => BlocProvider(
      create: (context) => UsersCubit(), child: CabinetPageRegistrationEmail());

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
  String _nameString = "Abror";
  String _passwordString = "salom9804";
  String _emailString = "abrorbobomurodov1998@gmail.com";
  String _comfirmPasswordString = "salom9804";
  bool _passwordVisible = false;
  bool _comfirmVisible = false;
  double INPUT_HEIGHT = 45;
  double INPUT_SPACE = 10;

  //
  final scaffoldState = GlobalKey<ScaffoldState>();

  //

  UsersCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<UsersCubit>(context);
    super.initState();
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
  void dispose() {
    cubit.close();
    _userName.dispose();
    _userEmail.dispose();
    _password.dispose();
    _comfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        backgroundColor: Colors.white,
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UsersLoginLoadedState) {
              SharePreference sharePreference = SharePreference();
              sharePreference.saveValue("name", _nameString);
              sharePreference.saveValue("email", _emailString);
              sharePreference.saveValue("password", _emailString);
              // String name = await sharePreference.get("name");
              Navigator.pop(context);
            }
            if (state is UsersErrorState) {
              return Center(
                child: Text(state.message),
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
                          child: Text(
                              "Только для зарегистрированных пользователей"),
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
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
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
                                      hintText: "Email",
                                      border: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
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
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      hintText: "Password",
                                      border: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
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
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black54),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
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
    );
  }

  Future<void> onPress() async {
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
    cubit.signup(SignupRequest(
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
