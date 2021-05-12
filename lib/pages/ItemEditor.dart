import 'package:schedule/logic/Day.dart';

import 'package:flutter/material.dart';

class ItemEditor extends StatefulWidget {
  final int itemIndex;

  ItemEditor(this.itemIndex);

  @override
  State<StatefulWidget> createState() => new ItemEditorState();
}

class ItemEditorState extends State<ItemEditor> {
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
    startHr = Days.days[Days.selectedDay].items[widget.itemIndex].startHr;
    startMin = Days.days[Days.selectedDay].items[widget.itemIndex].startMin;
    startStr = Days.days[Days.selectedDay].items[widget.itemIndex].startStr;
    endHr = Days.days[Days.selectedDay].items[widget.itemIndex].endHr;
    endMin = Days.days[Days.selectedDay].items[widget.itemIndex].endMin;
    endStr = Days.days[Days.selectedDay].items[widget.itemIndex].endStr;
    name = Days.days[Days.selectedDay].items[widget.itemIndex].name;
    place = Days.days[Days.selectedDay].items[widget.itemIndex].place;
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
                new TextField(
                  controller: TextEditingController(text: name),
                  enabled: true,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: const OutlineInputBorder(),
                  ),
                  style: Theme.of(context).textTheme.headline4,
                  onChanged: (String value) {
                    name = value;
                  },
                ),
                new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: new TextField(
                    controller: TextEditingController(text: place),
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
                new Card(
                  clipBehavior: Clip.antiAlias,
                  child: Material(
                    color: Colors.red,
                    child: new InkWell(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return new SimpleDialog(
                                title: Text("Are you sure you want to delete?"),
                                children: <Widget>[
                                  new SimpleDialogOption(
                                    child: new Text("Yes"),
                                    onPressed: () {
                                      Days.days[Days.selectedDay].items.removeAt(widget.itemIndex);
                                      
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  new SimpleDialogOption(
                                    child: new Text("No"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "DELETE",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
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
                    Days.days[Days.selectedDay].items[widget.itemIndex].startStr = startStr;
                    Days.days[Days.selectedDay].items[widget.itemIndex].startMin = startMin;
                    Days.days[Days.selectedDay].items[widget.itemIndex].startHr = startHr;
                    Days.days[Days.selectedDay].items[widget.itemIndex].endStr = endStr;
                    Days.days[Days.selectedDay].items[widget.itemIndex].endMin = endMin;
                    Days.days[Days.selectedDay].items[widget.itemIndex].endHr = endHr;
                    Days.days[Days.selectedDay].items[widget.itemIndex].name = name;
                    Days.days[Days.selectedDay].items[widget.itemIndex].place = place;
                    Navigator.pop(context);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
