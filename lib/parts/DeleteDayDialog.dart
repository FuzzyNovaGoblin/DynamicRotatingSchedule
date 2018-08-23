import 'package:flutter/material.dart';
import 'package:schedule/logic/Day.dart';

class DeleteDayDialog extends SimpleDialog
{
  int index;
  VoidCallback endDialog;
  DeleteDayDialog({this.index, this.endDialog});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
      title: Text("Are you sure you want to delete day \"" + Days.days[index].name + "\"?"),
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            new SimpleDialogOption(
              child: Text("Yes"),
              onPressed: (){
                Days.days.removeAt(index);
                Navigator.pop(context);
                endDialog();
              },
            ),
          ],
        )
      ],
    );
  }
}