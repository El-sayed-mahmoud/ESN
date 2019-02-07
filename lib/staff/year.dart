import 'package:flutter/material.dart';
import './post/year.dart' as post;
import './functions/Globalstate.dart';

class YearSelection {
  const YearSelection(this.name);
  final String name;
}

class Year extends StatefulWidget {
  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  GlobalState _store = GlobalState.instance;

  setYear() {
    _store.set('year', selectedyear.name);
  }

  YearSelection selectedyear;

  List<YearSelection> years = <YearSelection>[
    const YearSelection('First Year'),
    const YearSelection('Second Year'),
    const YearSelection('Third Year'),
    const YearSelection('Fourth Year'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: new DropdownButton<String>(
                  isExpanded: true,
                  iconSize: 26,
                  hint: new Text("Select Year"),
                  value: _store.get('year'),
                  onChanged: (String newValue) {
                    setState(() {
                      _store.set('year', newValue);
                    });
                    setYear();
                  },
                  items: [
                    DropdownMenuItem(
                        value: 'First Year',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "First Year",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                    DropdownMenuItem(
                        value: 'Second Year',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Second Year",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                    DropdownMenuItem(
                        value: 'Third Year',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Third Year",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                    DropdownMenuItem(
                        value: 'Fourth Year',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Fourth Year",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              color: Colors.white,
              child: post.year(),
            ),
          ),
        ],
      ),
    );
  }
}
