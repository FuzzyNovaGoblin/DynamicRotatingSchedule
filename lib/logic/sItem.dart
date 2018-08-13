import 'package:flutter/material.dart';

class sItem {
  String name;
  String place;
  int startHr;
  int startMin;
  String startStr;
  int endHr;
  int endMin;
  String endStr;

  sItem(
      {@required BuildContext context,
      this.endMin,
      this.endHr,
      this.endStr,
      this.startHr,
      this.startStr,
      this.place,
      this.name,
      this.startMin}) {
    startStr = TimeOfDay(hour: startHr, minute: startMin).format(context);
    endStr = TimeOfDay(hour: endHr, minute: endMin).format(context);
  }
}
