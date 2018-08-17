import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sItem.g.dart';


@JsonSerializable(disallowUnrecognizedKeys: true)
class sItem extends Object with _$sItemSerializerMixin{
  String name;
  String place;
  int startHr;
  int startMin;
  String startStr;
  int endHr;
  int endMin;
  String endStr;

  sItem(
      {this.endMin,
      this.endHr,
      this.endStr,
      this.startHr,
      this.startStr,
      this.place,
      this.name,
      this.startMin});

  factory sItem.fromJson(Map<String, dynamic> json) => _$sItemFromJson(json);

  void GenerateStrings(BuildContext context)
  {
    startStr = TimeOfDay(hour: startHr, minute: startMin).format(context);
    endStr = TimeOfDay(hour: endHr, minute: endMin).format(context);
  }
}
