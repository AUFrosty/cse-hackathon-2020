import 'package:flutter/material.dart';
import 'package:qpeople/userSearch.dart';
import 'package:qpeople/home.dart';


class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final bool showBackButton;
  final bool showBar;
//  final List<Widget> widgets;

  const SearchAppBar({Key key, this.title, this.appBar, this.showBackButton, this.showBar}) //this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Container(
          height: 200,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top:50.0, left:20, right:100, bottom: 10),
                        child: TextField(
                          controller: myController,
                          obscureText: false,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            labelText: 'Search Places',
                            suffixIcon:IconButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserSearch(searchContent: myController.text)));
                              },
                              icon:Icon(Icons.search),
                            ),
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: IconButton(
                        icon: Icon(Icons.person),
                        color: Colors.white,
                        splashColor: Colors.grey[100],
                        onPressed: () {
                          //TODO: Make this navigate to the login
                          //Navigator.of(context).push()

                        },
                      ),
                    ),
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: showBar ? Container (
                    height:50,
                    color: Color(0x50552DC8),
//
                    child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                        child: showBackButton ? IconButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                                },
                                icon:Icon(Icons.arrow_back),
                                color: Colors.white,
                                ) : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10, bottom:5),
                        child: Text(
                          this.title,
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ]
                    ),
                  ) :null,
                ),
              ]
          ),
        );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(220.0);
  }
}
