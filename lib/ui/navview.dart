import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schedule/logic/Day.dart';

class DayNavView extends StatefulWidget
{
  @override
  DayNavViewState createState()
  {
    return new DayNavViewState();
  }
  VoidCallback endpop;
  DayNavView(this.endpop);
}

class DayNavViewState extends State<DayNavView>
{
  @override
  Widget build(BuildContext context)
  {
    return new Drawer(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index)
        {
          if (index == Days.days.length)
          {
            return new Card(
              child: new InkWell(
                onTap: ()
                async {
//                  Navigator.pop(context);
                  await showDialog(
                      context: context,
                      builder: (BuildContext context)
                      {
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
                                onChanged: (String value)
                                {
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
                                  onPressed: ()
                                  => Navigator.pop(context),
                                ),
                                new SimpleDialogOption(
                                  child: Text("Done"),
                                  onPressed: ()
                                  {
                                    setState(()
                                    {
                                      if (dayName != "")
                                      {
                                        Days.days.add(new Day(dayName));
                                      }
                                    });
                                    Navigator.pop(context);
    
                                    Scaffold.of(context).showSnackBar(
//                                      new SnackBar(content: Text(dayName)));
                                        new SnackBar(content: Text("hello"))
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: ShapeDecoration(
                              shape: CircleBorder(), color: Colors.black),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add"),
                    )
                  ],
                ),
              ),
            );
          }
          else if (index < Days.days.length)
          {
            return Card(
                child: InkWell(
                  child: Text(Days.days[index].name,style: TextStyle(fontSize: 40.0),),
                  onTap: ()
                  {
                    print("index: "+index.toString());
                    Days.selectedDay = index;
                    
                      Navigator.pop(context);
                      widget.endpop();
                  },
                ));
          }
        },
      ),
    );
  }
}
