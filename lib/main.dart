import 'package:flutter/material.dart';
import 'package:schedule/pages/mainpage.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      title: "Schedule",
      theme: ThemeData(
        canvasColor: Colors.white,
        accentColor: Colors.black,
        primaryColor: Colors.grey,
        buttonColor: Colors.black,
        colorScheme: ColorScheme(
          primary: Color(0xff86c8c1),
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red[900],
          onBackground: Colors.black,
          onError: Colors.white,
          onPrimary: Colors.white38,
          onSurface: Colors.black,
          onSecondary: Colors.white,
          primaryVariant: Colors.black38,
          secondary: Colors.black,
          secondaryVariant: Colors.white,
          surface: Colors.white,
        ),
        shadowColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black), foregroundColor: MaterialStateProperty.all(Colors.white)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),
        ),
        timePickerTheme: TimePickerThemeData(backgroundColor: Colors.white, entryModeIconColor: Colors.black, hourMinuteTextColor: Colors.black, dayPeriodTextStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}

void main() => runApp(BaseApp());
