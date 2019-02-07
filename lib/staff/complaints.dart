import 'package:flutter/material.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pushNamed(context, "/Staff");
          },
        ),
        title: Text(
          "Complaints",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
