import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}


class _NotificationsState extends State<Notifications> {
  List<Widget> myfunctionlist() {
    List<Widget> listcard = new List<Widget>();
    for (int i = 0; i <= 10; i++) {
      listcard.add(
          new Card(
            child: new Container(
              height: 80.0,
              child: new Row(children: <Widget>[
                new CircleAvatar(backgroundImage: AssetImage("images/avatar.jpg")),
                new Text(
                  " HI liked to a post ... ",
                  textDirection: TextDirection.ltr,
                ),
              ]),
            ),
          )
      );
    }
    return listcard;

    }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: myfunctionlist(),
      ),
    );
  }
}