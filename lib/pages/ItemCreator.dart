import 'dart:async';
import 'dart:convert';
import 'package:schedule/logic/Day.dart';

import 'package:flutter/material.dart';
import 'package:schedule/logic/sItem.dart';

class ItemCreator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ItemCreatorState();
  VoidCallback endpop;
  VoidCallback saveData;

  ItemCreator(this.endpop, this.saveData);
}

class ItemCreatorState extends State<ItemCreator> {
  int startHr;
  int startMin;
  String startStr;
  int endHr;
  int endMin;
  String endStr;

  String name;
  String place;

  int dayInt;

  @override
  void initState() {
    super.initState();

    startHr = 0;
    startMin = 0;
    startStr = "--:--";
    endHr = 0;
    endMin = 0;
    endStr = "--:--";
    name = "";
    place = "";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                _InTextField(name: (s) => name = s, title: true, hint: "Name"),
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: new TextField(
                    decoration: InputDecoration(labelText: "Place", border: OutlineInputBorder()),
                    style: Theme.of(context).textTheme.bodyText1,
                    onChanged: (String value) {
                      place = value;
                    },
                  ),
                ),
                new Card(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(startStr),
                      new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new ElevatedButton.icon(
                            onPressed: () {
                              showTimePicker(context: context, initialTime: TimeOfDay(hour: startHr, minute: startMin)).then((TimeOfDay value) {
                                if (value != null) {
                                  startHr = value.hour;
                                  startMin = value.minute;

                                  setState(() {
                                    startStr = value.format(context);
                                  });
                                }
                              });
                            },
                            icon: Icon(Icons.access_time),
                            label: Text("set")),
                      )
                    ],
                  ),
                ),
                new Card(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text(endStr),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new ElevatedButton.icon(
                            onPressed: () {
                              showTimePicker(context: context, initialTime: TimeOfDay(hour: endHr, minute: endMin)).then((TimeOfDay value) {
                                if (value != null) {
                                  endHr = value.hour;
                                  endMin = value.minute;

                                  setState(() {
                                    endStr = value.format(context);
                                  });
                                }
                              });
                            },
                            icon: Icon(Icons.access_time),
                            label: Text("set")),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 25.0,
                right: 25.0,
                child: new FloatingActionButton(
                  child: Icon(
                    Icons.done,
                  ),
                  onPressed: () {
                    Days.days[Days.selectedDay].items.add(new sItem(endHr: endHr, endMin: endMin, name: name, place: place, startHr: startHr, startMin: startMin, endStr: endStr, startStr: startStr));
                    setState(() {
                      Navigator.pop(context);
                      widget.endpop();
                    });
                    Days.days[0].items[0].GenerateStrings(context);
                    widget.saveData();
                    print(Days.toJson());
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class _InTextField extends StatelessWidget {
  final Function(String) name;
  final bool title;
  final String hint;

  _InTextField({Key key, @required this.name, @required this.hint, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      decoration: InputDecoration(
        labelText: hint,
        border: const OutlineInputBorder(),
      ),
      style: Theme.of(context).textTheme.headline4,
      onChanged: (String value) {
        name(value);
      },
    );
  }
}
