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
import 'authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flappy_search_bar/flappy_search_bar.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
      title:Row(
        children: <Widget>[
          Expanded(
            child: Text(
                document['shop'],
                style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff)
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['Qnumber'].toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
      onTap: () {
        document.reference.updateData({
          'Qnumber': document['Qnumber'] + 1
        });
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Band Name'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection(('bandname')).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context,snapshot.data.documents[index]),
          );
        }),
    );
  }
}
