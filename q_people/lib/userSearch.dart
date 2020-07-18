import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qpeople/loading.dart';
import 'package:qpeople/home.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/shopInfo.dart';
import 'package:qpeople/shop.dart';
import 'package:qpeople/confirmation.dart';
import 'package:qpeople/constants.dart';
import 'package:qpeople/searchappbar.dart';

class UserSearch extends StatefulWidget {
  final String searchContent;
  const UserSearch({Key key, this.searchContent,})
      : super(key: key);

  @override
  _UserSearchState createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {

  callback(AsyncSnapshot<dynamic> snapshot, int index, String shopName)  async {
    //TODO: When a user clicks join queue it must update the counter increasing it by 1, Move to a new screen, update the joined status to true
    //print(updatedShops);
    int q = 0;
    int qNum = 0;
    String address;
    String shop;
    Future<void> func() async {
      Firestore.instance.collection('bandname').where('shop', isEqualTo: shopName)
          .snapshots().forEach((element) {
        q = (element.documents[0]['Qnumber']) + 1;
        address = (element.documents[0]['address']);
        shop =  (element.documents[0]['shop']);
      });
    }
    func();


    QuerySnapshot qShot = await Firestore.instance.collection('bandname').getDocuments();
    for (var i in qShot.documents) {
      if (i['shop'] == shopName) {
        i.reference.updateData({"Qnumber":  q});
        i.reference.updateData({"status": true});
      }
    }
    print(snapshot);
    setState(() {
      Firestore.instance.collection("personal").document().setData({"Qnumber": q, "address": address, "shop": shop, "status": true });
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
//    return Container();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: backgroundFlat,
        appBar: SearchAppBar(
          title: "Search Results for: " + widget.searchContent,
          showBackButton: true,
          showBar: true,
//          appBar: AppBar(),
//          widgets: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 00.0),
          child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 400,
                    height: 400,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 400,
                          child: StreamBuilder(
                              stream: Firestore.instance.collection(('bandname')).where('shop', isEqualTo: widget.searchContent ).where("status", isEqualTo: false).snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) return const Text('Loading...');
                                if (snapshot.data.documents.length == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Center(
                                      child: Container(
                                        width: 350,
                                        child: Card(
                                          elevation: 20.0,
                                          child: Center(
                                            child: Text(
                                                "No Shops matching that name are available for you to join the queue of.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                };

                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, index) {
                                    print(index);
                                    print(" Shop = ${widget.searchContent}, db = ${snapshot.data.documents[index]['shop']}");
                                      return HomeCard(shops: snapshot, shop: snapshot.data.documents[index], index: index, join: true, callback: callback);
                                  },
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

          ),
        )
    );
  }
}

