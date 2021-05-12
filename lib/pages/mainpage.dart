import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedule/logic/Day.dart';
import 'package:schedule/ui/navview.dart';
import 'package:schedule/pages/ItemCreator.dart';
import 'package:schedule/pages/ItemEditor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schedule/logic/Flags.dart';
import 'package:schedule/parts/ReorderButton.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  Choice _selectedChoice;

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  void initState() {
    super.initState();
    Flags.init();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (Days.selectedDay > 0 && Days.selectedDay >= Days.days.length) {
      setState(() => Days.selectedDay--);
    } else if (Days.selectedDay < 0) {
      setState(() => Days.selectedDay = 0);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: Text((Days.days.isNotEmpty) ? Days.days[Days.selectedDay].name : ""),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),
      drawer: new DayNavView(
        saveData: () async => saveData(),
        redrawClassList: () {
          saveData();
          setState(() {});
        },
      ),
      body: (Days.days.isNotEmpty)
          ? new Material(
              child: new Stack(
                children: <Widget>[
                  new ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      if (index < Days.days[Days.selectedDay].items.length) {
                        if ((_selectedChoice == choices[0])) {
                          return new Card(
                            child: new InkWell(
                              onLongPress: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemEditor(index))).then((value) {
                                  saveData();
                                  setState(() {});
                                });
                              },
                              child: new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          Days.days[Days.selectedDay].items[index].name,
                                          style: Theme.of(context).textTheme.headline5,
                                        ),
                                        new Text(
                                          Days.days[Days.selectedDay].items[index].place,
                                          style: Theme.of(context).textTheme.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Column(children: <Widget>[
                                    new Text(
                                      Days.days[Days.selectedDay].items[index].startStr,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    new Text(
                                      Days.days[Days.selectedDay].items[index].endStr,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ]),
                                  new ReorderButton(UpOrDown.Up, index, () {
                                    setState(() {});
                                  }),
                                  new ReorderButton(UpOrDown.Down, index, () {
                                    setState(() {});
                                  }),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return new Card(
                            child: InkWell(
                              onLongPress: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemEditor(index))).then((value) {
                                  saveData();
                                  setState(() {});
                                });
                              },
                              child: new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          Days.days[Days.selectedDay].items[index].name,
                                          style: Theme.of(context).textTheme.headline5,
                                        ),
                                        new Text(
                                          Days.days[Days.selectedDay].items[index].place,
                                          style: Theme.of(context).textTheme.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Column(children: <Widget>[
                                    new Text(
                                      Days.days[Days.selectedDay].items[index].startStr,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    new Text(
                                      Days.days[Days.selectedDay].items[index].endStr,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ])
                                ],
                              ),
                            ),
                          );
                        }
                      }
                      return null;
                    },
                  ),
                  new Positioned(
                      bottom: 25.0,
                      right: 25.0,
                      child: (_selectedChoice != choices[0])
                          ? new FloatingActionButton(
                              child: Icon(Icons.add),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemCreator(() => saveData()),
                                  ),
                                ).then((value) => setState(() {}));
                              },
                            )
                          : new FloatingActionButton(
                              child: Icon(Icons.check),
                              onPressed: () {
                                saveData();
                                Flags.reorder = false;
                                _select(null);
                              },
                            ))
                ],
              ),
            )
          : new Material(
              child: new InkWell(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String dayName = "";
                        TextEditingController controller = new TextEditingController();
                        return new SimpleDialog(
                          title: Text("Name"),
                          titlePadding: EdgeInsets.all(8.0),
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: controller,
                                onChanged: (String value) {
                                  dayName = value;
                                },
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new SimpleDialogOption(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      Days.selectedDay = 0;
                                      saveData();
                                    });
                                  },
                                ),
                                new SimpleDialogOption(
                                  child: Text("Done"),
                                  onPressed: () {
                                    setState(() {
                                      if (dayName != "") {
                                        Days.days.add(new Day(dayName));
                                      }
                                    });
                                    saveData();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      });
                },
                child: new Center(
                  child: Text("Click to add day"),
                ),
              ),
            ),
    );
  }

  saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Days.jsonKey, Days.toJson());
    prefs.setInt(Days.dayKey, Days.selectedDay);
  }

  loadData() async {
    print("start load data");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      String qux;
      qux = prefs.getString(Days.jsonKey) ?? "";

      print("The data: " + qux);
      if (qux != "") {
        List foo = json.decode(qux);
        Days.days.clear();
        for (int i = 0; i < foo.length; i++) {
          Days.days.add(Day.fromJson(foo[i]));
        }
      }
    });
    Days.selectedDay = (prefs.getInt(Days.dayKey) != null) ? prefs.getInt(Days.dayKey) : 0;
  }

  @override
  void didUpdateWidget(MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadData();
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Reorder', icon: Icons.reorder),
];
