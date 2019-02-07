import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:async';
enum IndicatorType { overscroll, refresh }

class section extends StatefulWidget {
  @override
  _sectionState createState() => _sectionState();
}


class _sectionState extends State<section> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  String url = 'http://uni-social.tk/api/v1/post';
  List data;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["data"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }
  bool StateLike = false;
  Color ColorLike = Colors.black26;

  setLikeColor() {
    if (StateLike)
      setState(() => ColorLike = Colors.black26);
    else
      setState(() => ColorLike = Colors.green.shade400);
    setState(() => StateLike = !StateLike);
  }



  String setTimePost(String datePost){
    DateTime dateNow = new DateTime.now();


    int yearPOst = int.parse(datePost.toString().substring(0,4).trim());
    int yearNow = int.parse(dateNow.toString().substring(0,4).trim());
    int year = yearNow - yearPOst;

    int monthPost = int.parse(datePost.toString().substring(5,7).trim());
    int monthNow = int.parse(dateNow.toString().substring(5,7).trim());
    int month = monthNow - monthPost;

    int dayPost = int.parse(datePost.toString().substring(8,10).trim());
    int dayNow = int.parse(dateNow.toString().substring(8,10).trim());
    int day = dayNow - dayPost;


    int hourPost = int.parse(datePost.toString().substring(11,13).trim());
    int hourNow = int.parse(dateNow.toString().substring(11,13).trim());
    int hour = hourNow - hourPost-2;


    if(year==0){} else  return "since $year year";
    if(month==0){} else return "since $month month";
    if(day==0){} else return "since $day day";
    if(hour==0){} else return "since $hour hour";
    return "Just Now";
  }



  //----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: makeRequest,
      child: ListView.builder(
        itemCount: data == null ? 0 :data.length,
        padding:const EdgeInsets.all(5.0),
        itemBuilder:(BuildContext context, i){

          return data[i]["status"] == 0 ? Text("") : Card(
              margin: EdgeInsets.only(bottom: 7.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    //------------------------- top design -------------------------

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 45.0,
                          width: 45.0,
                          margin:
                          EdgeInsets.only(left: 10.0, top: 10.0, right: 20.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/avatar.jpg"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  i % 2 == 0
                                      ? "ON"
                                      : "Ya",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Container(
                                margin: EdgeInsets.only(top: 2.0),
                                child: Text("Fourth Year CS : Section 2",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.pinkAccent.shade100,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //--------------------- content post ---------------------

                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment:  Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            child: Text(
                                  data[i]["content"],
                              textAlign: TextAlign.left,
                              style:
                              TextStyle(fontSize: 14.0, color: Colors.black87),
                            ),
                          ),
                          new Image(
                            image: AssetImage("images/sec.jpg"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white10,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new IconButton(
                                  onPressed: setLikeColor,
                                  icon:
                                  new ImageIcon(AssetImage("images/like.png")),
                                  color: ColorLike,
                                  iconSize: 20.0,
                                ),
                                new Text(
                                  "10K",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new IconButton(
                                  onPressed: () {},
                                  icon: new ImageIcon(
                                      AssetImage("images/comment.png")),
                                  color: Colors.cyanAccent.shade400,
                                  iconSize: 20.0,
                                ),
                                new Text(
                                  "575",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: new Text(
                                    setTimePost(data[i]['created_at'].toString().trim()),
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
