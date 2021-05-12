// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) {
  return new Day(json['name'] as String)
    ..items = (json['items'] as List)
        ?.map((e) =>
            e == null ? null : new SItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

abstract class _$DaySerializerMixin {
  String get name;
  List<SItem> get items;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'items': items};
}
