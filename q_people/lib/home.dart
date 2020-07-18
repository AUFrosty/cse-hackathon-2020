import 'package:flutter/material.dart';
import 'package:qpeople/loading.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/shopInfo.dart';
import 'package:qpeople/shop.dart';
import 'package:qpeople/confirmation.dart';
import 'package:qpeople/constants.dart';
import 'package:qpeople/searchappbar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final myController = TextEditingController();
    /*return Material(
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 120.0,),
              child: Container(
                width: width - 100.0,
                height: 1000,
                child: TextField(
                  controller: myController,
                  obscureText: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
                    labelText: 'Check Suburb Smoke Level ',
                    suffixIcon:IconButton(
                      onPressed: (){
                        //TODO: Implement this to push to new screen
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Suburb(suburb_name: myController.text,)));
                      },
                      color: Colors.black,
                      icon:Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ); */
    return Scaffold (
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundFlat,

      appBar:
      SearchAppBar(
        title: '',
        showBack: false,
      ),

      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  HomeCard(shopName: "Testing Shop Name", shopLocation: "123 Fake Street",)
                ],
              ),
            ),
          ],
        )

      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  String shopName;
  String shopLocation;
  HomeCard({this.shopName, this.shopLocation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(
                  shopName,
                  style: cardHeading,
                ),
                subtitle: Text(
                  shopLocation,
                  style: cardSubHeading,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 12.0),
                child: RaisedButton(
                  color: backgroundLeft,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {},
                  child: Text(
                      'Leave Queue',
                      style: buttonText,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}