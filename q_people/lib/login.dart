import 'package:flutter/material.dart';
import 'shopInfo.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/constants.dart';
import 'package:qpeople/searchappbar.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  String _email;
  String _password;
  String _displayName;
  bool _obsecure = false;

  @override
  Widget build(BuildContext context) {
    Color primary = buttonColor;
    void initState() {
      super.initState();
    }

    //input widget
    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(

        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: buttonColor,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: buttonColor,
                  width: 3,
                ),
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: buttonColor),
                  child: icon,
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              )),
        ),
      );
    }

    //button widget
    Widget _button(String text, Color splashColor, Color highlightColor,
        Color fillColor, Color textColor, void function(), String email, String password, String displayName, bool login) {
      return RaisedButton(
        highlightElevation: 0.0,
        splashColor: splashColor,
        highlightColor: highlightColor,
        elevation: 0.0,
        color: fillColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        ),
        onPressed: () {
          //TODO: Check login credentials
          //TODO: IF login matches a set criteria then the user is taken to the shop view else they are taken to the home page
          print("email = $email");
          print("password = $password");
          print("display name = $displayName");
          print("login = $login");
          if (login && email == "manager" && password == 'manager') {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => shopInfo()),
              ModalRoute.withName('/shopInfo'),
            );

          } else if (login) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
              ModalRoute.withName('/home'),
            );

          }
          function();
        },
      );
    }

    //login and register fuctions

    void _loginUser() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _emailController.clear();
      _passwordController.clear();
    }

    void _registerUser() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _displayName = _nameController.text;
      _emailController.clear();
      _passwordController.clear();
      _nameController.clear();
    }

    void _loginSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _emailController.clear();
                              _passwordController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: buttonColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Align(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: buttonColor),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 60),
                          child: _input(Icon(Icons.email), "EMAIL",
                              _emailController, false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: _input(Icon(Icons.lock), "PASSWORD",
                              _passwordController, true),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            child: _button(
                              "LOGIN",
                              Colors.white,
                              primary,
                              primary,
                              Colors.white,
                              _loginUser,
                              _emailController.text,
                              _passwordController.text,
                              _displayName,
                              true,
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    void _registerSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _emailController.clear();
                              _passwordController.clear();
                              _nameController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: buttonColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Align(
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: buttonColor),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 25, right: 40),
                                child: Text(
                                  "REGI",
                                  style: TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                child: Container(
                                  padding: EdgeInsets.only(top: 40, left: 28),
                                  width: 130,
                                  child: Text(
                                    "STER",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 20,
                          top: 60,
                        ),
                        child: _input(Icon(Icons.account_circle),
                            "DISPLAY NAME", _nameController, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: _input(Icon(Icons.email), "EMAIL",
                            _emailController, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: _input(Icon(Icons.lock), "PASSWORD",
                            _passwordController, true),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          child: _button("REGISTER", Colors.white, primary,
                              primary, Colors.white, _registerUser, _emailController.text,
                            _passwordController.text,
                            _displayName,
                            true,),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        //backgroundColor: buttonColor,

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight, // 10% of the width, so there are ten blinds.
              colors: [
                Color(0xffc6638E9),
                Color(0xffcA546F0)
              ], // whitish to gray
              tileMode: TileMode
                  .repeated, // repeats the gradient over the canvas
            ),
          ),
          child: Column(

            children: <Widget>[
              Padding(
                child: Container(
                  child: _button("LOGIN", primary, Colors.white, Colors.white,
                      primary, _loginSheet, _emailController.text,
                    _passwordController.text,
                    _displayName,
                    false,),
                  height: 50,
                ),
                padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              ),
              Padding(
                child: Container(
                  child: OutlineButton(
                    highlightedBorderColor: Colors.white,
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    highlightElevation: 0.0,
                    splashColor: Colors.white,
                    highlightColor: buttonColor,
                    color: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      _registerSheet();
                    },
                  ),
                  height: 50,
                ),
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              ),
              Expanded(
                child: Align(
                  child: ClipPath(
                    child: Container(
                      color: Colors.white,
                      height: 300,
                    ),
//                  clipper: BottomWaveClipper(),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ));
  }
}

