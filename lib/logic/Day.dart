import 'package:schedule/logic/SItem.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:schedule/parts/ReorderButton.dart';

part 'Day.g.dart';

@JsonSerializable()
class Day extends Object with _$DaySerializerMixin{
  String name;
  List<SItem> items;
  Day(this.name){
    items = [];
  }
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

class Days {
  static int selectedDay = 0;
  static const String dayKey = "daykey";
  static List<Day> days = [];
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
        SItem temp1 = days[selectedDay].items[itemIndex];
        SItem temp2 = days[selectedDay].items[itemIndex-1];
        days[selectedDay].items[itemIndex] = temp2;
        days[selectedDay].items[itemIndex-1] = temp1;
        break;
      case UpOrDown.Down:
        SItem temp1 = days[selectedDay].items[itemIndex];
        SItem temp2 = days[selectedDay].items[itemIndex+1];
        days[selectedDay].items[itemIndex] = temp2;
        days[selectedDay].items[itemIndex+1] = temp1;
        break;
    }
  }

}