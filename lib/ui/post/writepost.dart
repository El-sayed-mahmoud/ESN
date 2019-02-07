import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class writepost extends StatefulWidget {
  @override
  _writepostState createState() => _writepostState();
}

class _writepostState extends State<writepost> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 3),
    ));
  }

  @override
  void dispose() {
    _postcontroller.dispose();
    super.dispose();
  }

  bool _checkSec = false;
  bool _checkYear = false;
  TextEditingController _postcontroller = new TextEditingController();

  _addpost()async{
    if(_postcontroller.text.isEmpty)
      {
        showInSnackBar("please fill post");
        return;
      }
    else {
      var sendpost = await http.post(
          "http://uni-social.tk/api/v1/post/add", body: {
        "content": _postcontroller.text,
        "user_id": "1",
        "status": "0"
      });
      Navigator.of(context).pushNamed('/Student');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          InkWell(child:
          Icon(Icons.share,color: Colors.black,),
            onTap: (){
                      _addpost();

            },
          )
        ],
        title: Text("Publish Post",style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Card(
              color: Colors.white,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 5),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 40.0,
                      height: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/avatar.jpg"),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: null,
                    color: Colors.black12,
                    child: Row(
                      children: <Widget>[Text('Add',style: TextStyle(
                        color: Colors.white,
                      ),
                      ), Icon(Icons.add,color: Colors.white,)],
                    ),
                  ),
                ]),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                TextFormField(

                  controller: _postcontroller,
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
                      filled: true,
                      hintText: "Write your Post",
                      labelText: "Type Here"),
                  textCapitalization: TextCapitalization.words,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 18, color: Colors.black),

                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Select My Section",
                            style: TextStyle(fontSize: 16),
                          ),
                          Checkbox(
                            onChanged: (bool value) {
                              setState(() => this._checkSec = value);
                            },
                            value: this._checkSec,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Select My Group",
                            style: TextStyle(fontSize: 16),
                          ),
                          Checkbox(
                            onChanged: (bool value) {
                              setState(() => this._checkYear = value);
                            },
                            value: this._checkYear,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
