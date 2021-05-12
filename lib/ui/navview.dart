import 'package:flutter/material.dart';
import 'package:schedule/logic/Day.dart';
import 'package:schedule/parts/DeleteDayDialog.dart';

class DayNavView extends StatefulWidget {
  final VoidCallback saveData;
  DayNavView({this.saveData});

  @override
  DayNavViewState createState() {
    return new DayNavViewState();
  }
}

class DayNavViewState extends State<DayNavView> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView.builder(
        itemCount: Days.days.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < Days.days.length) {
            return new Card(
                child: new InkWell(
              child: Text(
                Days.days[index].name,
                style: TextStyle(fontSize: 40.0),
              ),
              onTap: () {
                Days.selectedDay = index;
                widget.saveData();
                Navigator.pop(context);
              },
              onLongPress: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return new DeleteDayDialog(
                        index: index,
                        endDialog: () async {
                          setState(() {});
                          widget.saveData();
                        },
                      );
                    });
              },
            ));
          } else {
            return new Card(
              child: new InkWell(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String dayName = "";
                        TextEditingController controller = new TextEditingController();
                        return new SimpleDialog(
                          title: Text("Add Day"),
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
                                  onPressed: () => Navigator.pop(context),
                                ),
                                new SimpleDialogOption(
                                  child: Text("Done"),
                                  onPressed: () {
                                    setState(() {
                                      if (dayName != "") {
                                        Days.days.add(new Day(dayName));
                                      }
                                      widget.saveData();
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      });
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.black),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add"),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
