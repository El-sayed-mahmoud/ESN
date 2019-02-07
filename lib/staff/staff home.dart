import 'dart:convert';

import 'package:flutter/material.dart';
import './drawer.dart' as D;
import './year.dart';
import './section.dart';
import '../ui/Notifications.dart';
import 'package:http/http.dart' as http;
enum IndicatorType { overscroll, refresh }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> with SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  TabController tabController;
  bool isPending = false;

  String url = 'http://uni-social.tk/api/v1/post';
  List data;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["data"];
      if(data[0]["status"]== 0)
        {
          isPending = true;
        }
      else
        {
          isPending = false;
        }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    this.makeRequest();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      appBar: AppBar(
          leading: InkWell(
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 25.0,
            ),
            onTap: () => _scaffoldKey.currentState.openDrawer(),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Admin Feeds",
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          actions: <Widget>[
            InkWell(
              child: Icon(Icons.notifications_active,
                color: isPending ? Colors.red : Colors.black,
              size: 30,),
              onTap: (){
                Navigator.of(context).pushNamed("/acceptpost");
              },
            ),
            IconButton(
                icon: const Icon(Icons.refresh,color: Colors.black,),
                tooltip: 'Refresh',
                onPressed: () {
                  _refreshIndicatorKey.currentState.show();
                }
            ),
        ],
      ),

      drawer: D.Draw(),

      //------------------------ body ------------------------

      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: makeRequest,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            Year(),
            Section(),
            Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              color: Colors.white30,
              child: ListView(
                children: <Widget>[Notifications()],
              ),
            ),
          ],
        ),
      ),

      //------------------------ floatingActionButton ------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/writePost_Staff");
        },
        child: Icon(
          Icons.create,
          size: 30.0,
        ),
        backgroundColor: Colors.black12,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.black,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 1,
          labelColor: Colors.grey,
          tabs: <Widget>[
            Icon(
              Icons.home,
              size: 26.0,
            ),
            Icon(
              Icons.person,
              size: 26.0,
            ),
            Icon(
              Icons.notifications,
              size: 26.0,
            ),
          ],
        ),
      ),
    );
  }
}
