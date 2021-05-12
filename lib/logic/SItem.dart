import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SItem.g.dart';


@JsonSerializable(disallowUnrecognizedKeys: true)
class SItem extends Object with _$SItemSerializerMixin{
  String name;
  String place;
  int startHr;
  int startMin;
  String startStr;
  int endHr;
  int endMin;
  String endStr;

  SItem(
      {this.endMin,
      this.endHr,
      this.endStr,
      this.startHr,
      this.startStr,
      this.place,
      this.name,
      this.startMin});

  factory SItem.fromJson(Map<String, dynamic> json) => _$SItemFromJson(json);

  void generateStrings(BuildContext context)
  {
    startStr = TimeOfDay(hour: startHr, minute: startMin).format(context);
    endStr = TimeOfDay(hour: endHr, minute: endMin).format(context);
  }
}
