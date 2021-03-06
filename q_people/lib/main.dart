import 'package:flutter/material.dart';
import 'package:qpeople/loading.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/shopInfo.dart';
import 'package:qpeople/shop.dart';
import 'package:qpeople/confirmation.dart';
import 'login.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/loading',
  routes: {
    '/loading': (context) => Loading(),
    '/home': (context) => Home(),
    '/userSearch': (context) => UserSearch(),
    '/login': (context) => SignIn()
    //'/location': (context) => ChooseLocation(),
  },
));
