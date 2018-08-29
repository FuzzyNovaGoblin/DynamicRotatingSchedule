import 'dart:async';

import 'sItem.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schedule/parts/ReorderButton.dart';

part 'Day.g.dart';

@JsonSerializable()
class Day extends Object with _$DaySerializerMixin{
  String name;
  List<sItem> items;
  Day(this.name){
    items = new List();
  }
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

class Days {
  static int selectedDay = 0;
  static const String dayKey = "daykey";
  static List<Day> days = new List();
  static const String jsonKey = "json";


  static String toJson()
  {
    return json.encode(days);
  }
  static void switchItems({int itemIndex, UpOrDown direction})
  {
    switch(direction)
    {
      case UpOrDown.Up:
        sItem temp1 = days[selectedDay].items[itemIndex];
        sItem temp2 = days[selectedDay].items[itemIndex-1];
        days[selectedDay].items[itemIndex] = temp2;
        days[selectedDay].items[itemIndex-1] = temp1;
        break;
      case UpOrDown.Down:
        sItem temp1 = days[selectedDay].items[itemIndex];
        sItem temp2 = days[selectedDay].items[itemIndex+1];
        days[selectedDay].items[itemIndex] = temp2;
        days[selectedDay].items[itemIndex+1] = temp1;
        break;
    }
  }

}