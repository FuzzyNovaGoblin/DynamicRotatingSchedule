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
          primary: Colors.black,
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Colors.black,
          onError: Colors.white,
          onPrimary: Colors.white,
          onSurface: Colors.black,
          onSecondary: Colors.white,
          primaryVariant: Colors.green,
          secondary: Colors.black,
          secondaryVariant: Colors.white,
          surface: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),
        ),
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.white,
          entryModeIconColor: Colors.black,
          hourMinuteTextColor: Colors.black,
          dialHandColor: Colors.black,
          dayPeriodColor: Colors.black,
        ),
      ),
    );
  }
}

void main() => runApp(BaseApp());
