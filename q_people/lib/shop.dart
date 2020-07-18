import 'package:flutter/material.dart';
import 'package:qpeople/loading.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/shopInfo.dart';
import 'package:qpeople/shop.dart';
import 'package:qpeople/confirmation.dart';

class Shop {
  String name;
  String location;
  int curr_occupancy;
  Key key;
  Shop({this.name, this.curr_occupancy, this.location, this.key});
}