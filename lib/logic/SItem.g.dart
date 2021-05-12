// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SItem _$SItemFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const [
    'name',
    'place',
    'startHr',
    'startMin',
    'startStr',
    'endHr',
    'endMin',
    'endStr'
  ]);
  return new SItem(
      endMin: json['endMin'] as int,
      endHr: json['endHr'] as int,
      endStr: json['endStr'] as String,
      startHr: json['startHr'] as int,
      startStr: json['startStr'] as String,
      place: json['place'] as String,
      name: json['name'] as String,
      startMin: json['startMin'] as int);
}

abstract class _$SItemSerializerMixin {
  String get name;
  String get place;
  int get startHr;
  int get startMin;
  String get startStr;
  int get endHr;
  int get endMin;
  String get endStr;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'place': place,
        'startHr': startHr,
        'startMin': startMin,
        'startStr': startStr,
        'endHr': endHr,
        'endMin': endMin,
        'endStr': endStr
      };
}
