import 'package:flutter/material.dart';
import 'package:schedule/pages/ItemCreator.dart';
import 'package:schedule/pages/mainpage.dart';

void main() => runApp(new MaterialApp(
    home: MainPage(),
    title: "Schedule",
    theme: ThemeData(
      canvasColor: Colors.white,
      accentColor: Colors.black,
      primaryColor: Colors.grey,
//        backgroundColor: Colors.white,
//      textTheme: TextTheme(display1: TextStyle(color: Colors.black)),
    ),


));
