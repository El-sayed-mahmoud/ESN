import 'package:flutter/material.dart';
import './drawerstudent.dart';
import './Notifications.dart';
import 'package:untitled1/ui/post/year.dart';
import 'package:untitled1/ui/post/section.dart';
class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          'Fourth Year',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 25.0,
          ),
          onTap: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),

      //Drawer
      drawer: drawerstudent(),


      //write post
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black12,
        onPressed: (){
           Navigator.of(context).pushNamed('/writepost');
        },
        child: Icon(Icons.create),
      ),
      //body
      body: Container(
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            year(),
            section(),
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

      //bottomNavigationBar for year&&section&&Notifications
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.lightBlueAccent,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 0.000000001,
          labelColor: Colors.lightBlue,
          tabs: <Widget>[
            Icon(
              Icons.home,
              size: 26.0,
            ),
            Icon(
              Icons.low_priority,
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
