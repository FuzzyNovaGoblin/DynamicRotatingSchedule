import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schedule/logic/Day.dart';
import 'package:schedule/ui/navview.dart';
import 'package:schedule/pages/ItemCreator.dart';
import 'package:schedule/pages/ItemEditor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {



  @override
  void initState() {
    print("runing init state");
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
    });
    return new Scaffold(
      appBar: new AppBar(
        title: Text( //"hello"),
            (Days.days.isNotEmpty) ? Days.days[Days.selectedDay].name : ""),
      ),
      drawer: new DayNavView(
          endpop: () {
        setState(() {});
      },
      saveData: () async => saveData(),
      ),
      body: (Days.days.isNotEmpty)
          ? new Material(
        child: new Stack(
          children: <Widget>[
            new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index < Days.days[Days.selectedDay].items.length) {
                  print("index: " + index.toString());
                  print("Days.days[Days.selectedDay].items.length: " +
                      Days.days[Days.selectedDay].items.length
                          .toString());
//                        return new Text("h");
                  return new Card(
                    child: InkWell(
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ItemEditor(() {
                                      setState() {}
                                    }, index)));
                      },
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  Days.days[Days.selectedDay].items[index]
                                      .name,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline,
                                ),
                                new Text(
                                  Days.days[Days.selectedDay].items[index]
                                      .place,
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .subhead,
                                ),
                              ],
                            ),
                          ),
                          new Column(children: <Widget>[
                            new Text(
                              Days.days[Days.selectedDay].items[index]
                                  .startStr,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .body1,
                            ),
                            new Text(
                              Days.days[Days.selectedDay].items[index]
                                  .endStr,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .body1,
                            ),
                          ])
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            new Positioned(
                bottom: 25.0,
                right: 25.0,
                child: new FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ItemCreator(
                                        () {setState() {}},
                                    ()=>saveData()
                                )));
                  },
                ))
          ],
        ),
      )
          : new Material(
        child: new InkWell(
          onTap: () async {
//                  Navigator.pop(context);
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  String dayName = "";
                  TextEditingController controller =
                  new TextEditingController();
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
                            print(value);
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
                            onPressed: () => Navigator.pop(context),
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

                              Scaffold.of(context).showSnackBar(
//                                      new SnackBar(content: Text(dayName)));
                                  new SnackBar(content: Text("hello")));
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
  }

  loadData() async {
    print("start load data");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState((){
      String qux;
      qux = prefs.getString(Days.jsonKey) ?? "";

      print("The data: " + qux);
      if (qux != "") {
        List foo = json.decode(qux);
        Days.days.clear();
        for (int i = 0; i < foo.length; i++)
          {
            Days.days.add(Day.fromJson(foo[i]));
          }
      }
    });

  }

  @override
  void didUpdateWidget(MainPage oldWidget) {
    loadData();
  }
}
