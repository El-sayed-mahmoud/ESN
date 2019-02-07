import 'package:flutter/material.dart';

class sendcomplaints extends StatefulWidget {
  @override
  _sendcomplaintsState createState() => _sendcomplaintsState();
}

class _sendcomplaintsState extends State<sendcomplaints> {
  bool checkboxofmanager = false;
  bool checkboxofsecretary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "send complaint",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                new ExpansionTile(
                  title: new Text("Category"),
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Checkbox(
                            value: checkboxofmanager,
                            onChanged: (bool value) {
                              setState(() {
                                checkboxofmanager = value;
                                checkboxofsecretary = false;
                              });
                            }),
                        new Text("manger"),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Checkbox(
                            value: checkboxofsecretary,
                            onChanged: (bool value) {
                              setState(() {
                                checkboxofsecretary = value;
                                checkboxofmanager = false;
                              });
                            }),
                        new Text("Secretary"),
                      ],
                    ),
                  ],
                ),
                TextFormField(
                  controller: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),

                      ) ,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(

                              color: Colors.black
                          )
                      ),

                      hintText: "Write your complain ",
                      labelText: "                     "
                          "       Type Here"),
                  textCapitalization: TextCapitalization.words,
                  maxLines: 8,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                RaisedButton(
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        Text("Send",style: TextStyle(
                        ),),
                      ],
                    ),
                    onPressed:()=>debugPrint("hi")
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
