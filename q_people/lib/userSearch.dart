import 'package:flutter/material.dart';
import 'package:qpeople/loading.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/shopInfo.dart';
import 'package:qpeople/shop.dart';
import 'package:qpeople/confirmation.dart';
import 'package:qpeople/searchappbar.dart';

class UserSearch extends StatefulWidget {
  final String searchContent;
  const UserSearch({Key key, this.searchContent,})
      : super(key: key);

  @override
  _UserSearchState createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  @override
  Widget build(BuildContext context) {
//    return Container();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: SearchAppBar(
          title: Text('title'),
//          appBar: AppBar(),
//          widgets: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Container(
          width: width,
          height: 170,

          child: ListView(
            //TODO: Make These clickable
              padding: const EdgeInsets.all(8),

              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
              ],
          ),
        )
    );
  }
}

