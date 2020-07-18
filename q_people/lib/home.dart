//import 'package:flutter/material.dart';
//import 'package:qpeople/loading.dart';
//import 'package:qpeople/home.dart';
//import 'package:qpeople/userSearch.dart';
//import 'package:qpeople/shopInfo.dart';
//import 'package:qpeople/shop.dart';
//import 'package:qpeople/confirmation.dart';
//
//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

import 'package:flutter/material.dart';
//import 'package:flappy_search_bar/flappy_search_bar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  //Map data = {};

  @override
  Widget build(BuildContext context) {

    //data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print(data);

    //set background
    //String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    //Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Container(

        child: Stack(
          children: <Widget>[

            Container(
                child: Column(
                  children: <Widget>[
                      SizedBox(height:12.0),
                      Text("Top 5 Hazy Suburbs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.black)
                      ),
                  ]
                )
            ),
          ],
        ),
      ),
    );
  }
}

class TopHazy extends StatelessWidget {
  String city;
  TopHazy({this.city});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0),),
      ),
      height: 50,
      //color: Colors.amber[600],
      child:  Center(
          child: Text(
              city,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              )
          )
      ),
    );
  }
}


class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}

