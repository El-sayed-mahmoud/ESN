import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class Add {
  const Add(this.name);

  final String name;
}

class _MyAppState extends State<MyApp> {
  _writePostForAdmin()async{

    var sendpost =await http.post("http://uni-social.tk/api/v1/post/add",body:{
      "content": _postcontroller.text,
      "user_id":"1",
      "status":"1"
    });
      Navigator.pushNamed(context, "/Staff");
  }

  TextEditingController _postcontroller = new TextEditingController();

  @override
  void dispose() {
    _postcontroller.dispose();
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String valueDB = "";
  Add selectedItem;
  List<Add> Items = <Add>[
    const Add('File'),
    const Add('Image'),
    const Add('Camera')
  ];

  bool F1 = false;
  bool S2 = false;
  bool T3 = false;
  bool F4 = false;

  bool TCS = false;
  bool TIS = false;
  bool FCS = false;
  bool FIS = false;

  List F1Y = [false, false, false, false];
  List S2Y = [false, false, false, false];
  List T3Y = [false, false, false, false, false, false, false, false];
  List F4Y = [false, false, false, false, false, false, false, false];


  void checkboxvalue(bool checkvalue,bool savedvalue){
    setState(() {
      savedvalue = checkvalue;
    });
  }

  Icon iconSelectYear = new Icon(
    Icons.arrow_drop_up,
    size: 35,
  );
  bool yearstate = false;
  Container ContainerYear = new Container();
  int Lines = 10;

  Container _setContainer() {
    return new Container(
      child: Expanded(
        child: Container(
          color: Colors.grey.shade200,
          child: ListView(
            children: <Widget>[
              ExpansionTile(
                leading: Checkbox(value: F1,
                    onChanged:  (v){setState(() {
                      F1=v;
                      F1Y[0]=v;F1Y[1]=v;F1Y[2]=v;F1Y[3]=v;
                    });},
                ),
                title: new Text(
                  "First year",
                  style: TextStyle(fontSize: 18),
                ),
                children: <Widget>[
                  CheckboxListTile(
                    value: F1Y[0],
                    onChanged: (v){setState(() {
                      F1Y[0]=v;
                      if(F1Y[0]==F1Y[1]&&F1Y[1]==F1Y[2]&&F1Y[2]==F1Y[3]){
                        F1=v;}else if(v==false) F1=v;
                    });},
                    title: new Text(
                      "Section 1",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: F1Y[1],
                    onChanged: (v){setState(() {
                      F1Y[1]=v;
                      if(F1Y[0]==F1Y[1]&&F1Y[1]==F1Y[2]&&F1Y[2]==F1Y[3]){
                        F1=v;}else if(v==false) F1=v;
                    });},
                    title: new Text(
                      "Section 2",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: F1Y[2],
                    onChanged: (bool v) {setState(() {
                      F1Y[2]=v;
                      if(F1Y[0]==F1Y[1]&&F1Y[1]==F1Y[2]&&F1Y[2]==F1Y[3]){
                        F1=v;}else if(v==false) F1=v;
                    });},
                    title: new Text(
                      "Section 3",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: F1Y[3],
                    onChanged: (bool v) {setState(() {
                      F1Y[3]=v;
                      if(F1Y[0]==F1Y[1]&&F1Y[1]==F1Y[2]&&F1Y[2]==F1Y[3]){
                        F1=v;}else if(v==false) F1=v;
                    });},
                    title: new Text(
                      "Section 4",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),





              ExpansionTile(
                leading: Checkbox(value: S2,
                    onChanged:(v){setState(() {
                      S2=v;
                      S2Y[0]=v;S2Y[1]=v;S2Y[2]=v;S2Y[3]=v;
                    });},
                ),
                title: new Text(
                  "Second year",
                  style: TextStyle(fontSize: 18),
                ),
                children: <Widget>[
                  CheckboxListTile(
                    value: S2Y[0],
                    onChanged:(bool v) {setState(() {
                      S2Y[0]=v;
                      if(S2Y[0]==S2Y[1]&&S2Y[1]==S2Y[2]&&S2Y[2]==S2Y[3]){
                        S2=v;}else if(v==false) S2=v;
                    });},
                    title: new Text(
                      "Section 1",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: S2Y[1],
                    onChanged:(bool v) {setState(() {
                      S2Y[1]=v;
                      if(S2Y[0]==S2Y[1]&&S2Y[1]==S2Y[2]&&S2Y[2]==S2Y[3]){
                        S2=v;}else if(v==false) S2=v;
                    });},
                    title: new Text(
                      "Section 2",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: S2Y[2],
                    onChanged:(bool v) {setState(() {
                      S2Y[2]=v;
                      if(S2Y[0]==S2Y[1]&&S2Y[1]==S2Y[2]&&S2Y[2]==S2Y[3]){
                        S2=v;}else if(v==false) S2=v;
                    });},
                    title: new Text(
                      "Section 3",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: S2Y[3],
                    onChanged:(bool v) {setState(() {
                      S2Y[3]=v;
                      if(S2Y[0]==S2Y[1]&&S2Y[1]==S2Y[2]&&S2Y[2]==S2Y[3]){
                        S2=v;}else if(v==false) S2=v;
                    });},
                    title: new Text(
                      "Section 4",
                      style: TextStyle(fontSize: 16),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),






              ExpansionTile(
                leading: Checkbox(value: T3,
                    onChanged: (v){setState(() {
                      T3=v;
                      TCS=v;TIS=v;T3Y[0]=v;T3Y[1]=v;T3Y[2]=v;T3Y[3]=v;
                      T3Y[4]=v;T3Y[5]=v;T3Y[6]=v;T3Y[7]=v;
                    });},
                ),
                title: new Text(
                  "Third year",
                  style: TextStyle(fontSize: 18),
                ),
                children: <Widget>[
                  ExpansionTile(
                    leading: Checkbox(value: TCS,
                        onChanged: (v){setState(() {
                          TCS=v;
                          T3Y[0]=v;T3Y[1]=v;T3Y[2]=v;T3Y[3]=v;
                          if(TCS==TIS&&TCS==true){
                            T3=true;
                          }else T3=false;
                        });},
                    ),
                    title: new Text(
                      "CS",
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        value: T3Y[0],
                        onChanged: (bool v) {setState(() {
                          T3Y[0]=v;
                          if(T3Y[0]==T3Y[1]&&T3Y[1]==T3Y[2]&&T3Y[2]==T3Y[3]){
                            TCS=v;}else if(v==false) TCS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 1",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: T3Y[1],
                        onChanged: (bool v) {setState(() {
                          T3Y[1]=v;
                          if(T3Y[0]==T3Y[1]&&T3Y[1]==T3Y[2]&&T3Y[2]==T3Y[3]){
                            TCS=v;}else if(v==false) TCS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 2",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: T3Y[2],
                        onChanged: (bool v) {setState(() {
                          T3Y[2]=v;
                          if(T3Y[0]==T3Y[1]&&T3Y[1]==T3Y[2]&&T3Y[2]==T3Y[3]){
                            TCS=v;}else if(v==false) TCS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 3",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: T3Y[3],
                        onChanged:(bool v) {setState(() {
                          T3Y[3]=v;
                          if(T3Y[0]==T3Y[1]&&T3Y[1]==T3Y[2]&&T3Y[2]==T3Y[3]){
                            TCS=v;}else if(v==false) TCS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 4",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Checkbox(value: TIS,
                        onChanged: (v){setState(() {
                          TIS=v;
                          T3Y[4]=v;T3Y[5]=v;T3Y[6]=v;T3Y[7]=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                    ),
                    title: new Text(
                      "IS",
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        value: T3Y[4],
                        onChanged:(bool v) {setState(() {
                          T3Y[4]=v;
                          if(T3Y[4]==T3Y[5]&&T3Y[5]==T3Y[6]&&T3Y[6]==T3Y[7]){
                            TIS=v;}else if(v==false) TIS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 1",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: T3Y[5],
                        onChanged:(bool v) {setState(() {
                          T3Y[5]=v;
                          if(T3Y[4]==T3Y[5]&&T3Y[5]==T3Y[6]&&T3Y[6]==T3Y[7]){
                            TIS=v;}else if(v==false) TIS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 2",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: T3Y[6],
                        onChanged:(bool v) {setState(() {
                          T3Y[6]=v;
                          if(T3Y[4]==T3Y[5]&&T3Y[5]==T3Y[6]&&T3Y[6]==T3Y[7]){
                            TIS=v;}else if(v==false) TIS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 3",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: T3Y[7],
                        onChanged:(bool v) {setState(() {
                          T3Y[7]=v;
                          if(T3Y[4]==T3Y[5]&&T3Y[5]==T3Y[6]&&T3Y[6]==T3Y[7]){
                            TIS=v;}else if(v==false) TIS=v;
                          if(TCS==TIS) T3=TCS;
                          else T3=false;
                        });},
                        title: new Text(
                          "Section 4",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ],
              ),






              ExpansionTile(
                leading: Checkbox(value: F4,
                  onChanged: (v){setState(() {
                    F4=v;
                    FCS=v;FIS=v;F4Y[0]=v;F4Y[1]=v;F4Y[2]=v;F4Y[3]=v;
                    F4Y[4]=v;F4Y[5]=v;F4Y[6]=v;F4Y[7]=v;
                  });},
                ),
                title: new Text(
                  "Forth year",
                  style: TextStyle(fontSize: 18),
                ),
                children: <Widget>[
                  ExpansionTile(
                    leading: Checkbox(value: FCS,
                      onChanged: (v){setState(() {
                        FCS=v;
                        F4Y[0]=v;F4Y[1]=v;F4Y[2]=v;F4Y[3]=v;
                        if(FCS==FIS&&FCS==true){
                          F4=true;
                        }else F4=false;
                      });},
                    ),
                    title: new Text(
                      "CS",
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        value: F4Y[0],
                        onChanged: (bool v) {setState(() {
                          F4Y[0]=v;
                          if(F4Y[0]==F4Y[1]&&F4Y[1]==F4Y[2]&&F4Y[2]==F4Y[3]){
                            FCS=v;}else if(v==false) FCS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 1",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: F4Y[1],
                        onChanged:(bool v) {setState(() {
                          F4Y[1]=v;
                          if(F4Y[0]==F4Y[1]&&F4Y[1]==F4Y[2]&&F4Y[2]==F4Y[3]){
                            FCS=v;}else if(v==false) FCS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 2",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: F4Y[2],
                        onChanged: (bool v) {setState(() {
                          F4Y[2]=v;
                          if(F4Y[0]==F4Y[1]&&F4Y[1]==F4Y[2]&&F4Y[2]==F4Y[3]){
                            FCS=v;}else if(v==false) FCS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 3",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: F4Y[3],
                        onChanged:(bool v) {setState(() {
                          F4Y[3]=v;
                          if(F4Y[0]==F4Y[1]&&F4Y[1]==F4Y[2]&&F4Y[2]==F4Y[3]){
                            FCS=v;}else if(v==false) FCS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 4",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Checkbox(value: FIS,
                      onChanged:  (v){setState(() {
                        FIS=v;
                        F4Y[4]=v;F4Y[5]=v;F4Y[6]=v;F4Y[7]=v;
                        if(FCS==FIS&&FCS==true){
                          F4=true;
                        }else F4=false;
                      });},

                    ),
                    title: new Text(
                      "IS",
                      style: TextStyle(fontSize: 18),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        value: F4Y[4],
                        onChanged: (bool v) {setState(() {
                          F4Y[4]=v;
                          if(F4Y[4]==F4Y[5]&&F4Y[5]==F4Y[6]&&F4Y[6]==F4Y[7]){
                            FIS=v;}else if(v==false) FIS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 1",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: F4Y[5],
                        onChanged: (bool v) {setState(() {
                          F4Y[5]=v;
                          if(F4Y[4]==F4Y[5]&&F4Y[5]==F4Y[6]&&F4Y[6]==F4Y[7]){
                            FIS=v;}else if(v==false) FIS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 2",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: F4Y[6],
                        onChanged: (bool v) {setState(() {
                          F4Y[6]=v;
                          if(F4Y[4]==F4Y[5]&&F4Y[5]==F4Y[6]&&F4Y[6]==F4Y[7]){
                            FIS=v;}else if(v==false) FIS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 3",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: F4Y[7],
                        onChanged:(bool v) {setState(() {
                          F4Y[7]=v;
                          if(F4Y[4]==F4Y[5]&&F4Y[5]==F4Y[6]&&F4Y[6]==F4Y[7]){
                            FIS=v;}else if(v==false) FIS=v;
                          if(FCS==FIS) F4=FCS;
                          else F4=false;
                        });},
                        title: new Text(
                          "Section 4",
                          style: TextStyle(fontSize: 16),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            key: _scaffoldKey,

            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              leading: InkWell(
                child: Icon(Icons.arrow_back),
                onTap: (){
                  Navigator.of(context).pushNamed("/Staff");

                },
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              title: new Text("Publish Post",style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: new IconButton(
                      onPressed: _writePostForAdmin,
                      icon: Icon(
                        Icons.share,

                      )),
                )
              ],
            ),

            // ---------------------------- start body ---------------
            // ---------------------------- start body ---------------
            // ---------------------------- start body ---------------

            body: new Container(
              child: new Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.cyan,
                  ),
                  child: new Container(
                      child: new Column(
                    children: <Widget>[
                      new Container(
                        color: Colors.grey.shade200,
                        padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.all(0),
                                        child: new CircleAvatar(
                                          minRadius: 20,
                                        )),
                                    Text(
                                      " Admin ",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.only(right: 10),
                                child: new DropdownButton<Add>(
                                  hint: new Text("Select"),
                                  value: selectedItem,
                                  onChanged: (Add newValue) {
                                    setState(() {
                                      selectedItem = newValue;
                                    });
                                  },
                                  //value: selectedUser,
                                  items: Items.map((Add Item) {
                                    return new DropdownMenuItem<Add>(
                                      value: Item,
                                      child: new Text(
                                        Item.name,
                                        style: new TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  iconSize: 30,
                                  elevation: 50,
                                ))
                          ],
                        ),
                      ),

                      //------------------------------------------- write post here
                      //------------------------------------------- write post here
                      //------------------------------------------- write post here
                      //------------------------------------------- write post here

                      Expanded(
                        child: new Container(
                          color: Colors.white10,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _postcontroller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  filled: true,
                                  hintText: "Write your Post",
                                  labelText: "Type Here"),
                              textCapitalization: TextCapitalization.words,
                              maxLines: 7,
                              keyboardType: TextInputType.text,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ),

                      //--------------------------------- select where to share post
                      //--------------------------------- select where to share post
                      //--------------------------------- select where to share post
                      //--------------------------------- select where to share post
                      _setContainer(),
                    ],
                  ))),
            )));
  }
}
