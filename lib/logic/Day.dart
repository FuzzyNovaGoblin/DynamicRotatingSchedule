import 'dart:async';

import 'sItem.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
  static List<Day> days = new List();
  static const String jsonKey = "json";


  static String toJson()
  {
    return json.encode(days);
  }


}