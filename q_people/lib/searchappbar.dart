import 'package:flutter/material.dart';
import 'package:qpeople/userSearch.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
//  final List<Widget> widgets;

  const SearchAppBar({Key key, this.title, this.appBar, }) //this.widgets})
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
                const Radius.circular(5.0),
              ),
            ),
            labelText: 'Search Places',
            suffixIcon:IconButton(
              onPressed: (){
                //TODO: Implement this to push to new screen
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserSearch(searchContent: myController.text,)));
              },
              icon:Icon(Icons.search),
            ),
          )
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(150.0);
  }
}
