import 'sItem.dart';
class Day{
  String name;
  List<sItem> items;
  Day(this.name){
    items = new List();
  }
}
class Days{
  static int selectedDay = 0;
  static List<Day> days = new List();
}