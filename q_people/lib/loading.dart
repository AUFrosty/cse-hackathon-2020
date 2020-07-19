import 'package:flutter/material.dart';
import 'package:qpeople/loading.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/shopInfo.dart';
import 'package:qpeople/shop.dart';
import 'package:qpeople/confirmation.dart';
import 'package:qpeople/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/home', arguments: {});
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [backgroundLeft, backgroundRight], // whitish to gray
            tileMode: TileMode.repeated,
          ),// repeats the gradient over the canvas
        ),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height/2 - 100,),
            Text(
              'Q',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 80.0,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 20,),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),

    );
  }
}