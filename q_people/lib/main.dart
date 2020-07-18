import 'package:flutter/material.dart';
import 'package:qpeople/loading.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/shopInfo.dart';
import 'package:qpeople/shop.dart';
import 'package:qpeople/confirmation.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    //'/': (context) => Loading(),
    '/home': (context) => Home(),
    //'/location': (context) => ChooseLocation(),
  },
));
