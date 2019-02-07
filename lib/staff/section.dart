import 'package:flutter/material.dart';
import './post/section.dart' as post;
import './functions/Globalstate.dart';

class SectionSelection {
  const SectionSelection(this.name);
  final String name;
}

class Section extends StatefulWidget {
  @override
  _SectionState createState() => _SectionState();
}

GlobalState _store = GlobalState.instance;

class _SectionState extends State<Section> {
  setSection() {
    _store.set('section', selectedSection.name);
  }

  SectionSelection selectedSection;
  List<SectionSelection> sections = <SectionSelection>[
    const SectionSelection('Section 1'),
    const SectionSelection('Section 2'),
    const SectionSelection('Section 3'),
    const SectionSelection('Section 4'),
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
                  disabledHint: Text('Please Choose Year First') ,
                  isDense: true,
                  isExpanded: true,
                  iconSize: 26,
                  hint: new Text(
                      "${_store.get('year') == null ? 'Please Choose Year First' : 'Select Section from ' + _store.get('year')}"),
                  value: _store.get('section'),
                  onChanged: (String newValue) {
                    setState(() {
                      _store.set('section', newValue);
                    });
                    setSection();
                  },
                  items: [
                    DropdownMenuItem(
                        value: 'Section 1',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Section 1",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                    DropdownMenuItem(
                        value: 'Section 2',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Section 2",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                    DropdownMenuItem(
                        value: 'Section 3',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Section 3",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                    DropdownMenuItem(
                        value: 'Section 4',
                        child: new Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Section 4",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black87),
                            ))),
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: post.section(),
            ),
          ),
        ],
      ),
    );
  }
}
