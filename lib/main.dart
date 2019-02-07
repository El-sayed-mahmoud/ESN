import 'package:flutter/material.dart';
import 'package:untitled1/ui/student.dart' as student;
import 'package:untitled1/ui/post/writepost.dart' as writepost;
import './ui/Login_Page.dart' as Login_Page;
import './ui/complaints.dart'as sendcomplaints;
import 'package:splashscreen/splashscreen.dart';
import './staff/staff home.dart' as staff;
import 'package:untitled1/staff/post/writePost.dart' as wp;
import './staff/accept post.dart'as acceptpost;
import './staff/complaints.dart' as Complaints;
main() {
  runApp(MaterialApp(
      title: "UniSocial",
      home: MyApp(),
      routes: <String, WidgetBuilder>{
        '/Login': (context) => Login_Page.LoginPage(),
        '/Student': (context) => student.Student(),
        '/writepost': (context) => writepost.writepost(),
        '/sendcomplaints': (context) => sendcomplaints.sendcomplaints(),
        '/Staff':(context) => staff.Admin(),
        '/writePost_Staff':(context) => wp.MyApp(),
        '/acceptpost':(context) => acceptpost.acceptandrejectpost(),
        '/complaints':(context) => Complaints.Complaints(),
      }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new Login_Page.LoginPage(),
        title: new Text('Welcome In UniSocial',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.asset('images/login_logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Hello"),
        loaderColor: Colors.red
    );
  }
}
