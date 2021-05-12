import 'package:flutter/material.dart';
import 'package:schedule/pages/mainpage.dart';
import 'package:schedule/ui/FuzColors.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      title: "Schedule",
      theme: ThemeData(
        // canvasColor: Colors.white,
        accentColor: FuzColors.maincolorAccent,
        primaryColor: FuzColors.maincolor,
        // buttonColor: Colors.black,
        colorScheme: ColorScheme(
          primary:  FuzColors.maincolor,
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red[900],
          onBackground: Colors.black,
          onError: Colors.white,
          onPrimary: Colors.white,
          onSurface: Colors.black,
          onSecondary: Colors.white,
          primaryVariant: FuzColors.maincoloralternate,
          secondary: FuzColors.maincolor,
          secondaryVariant: Colors.white,
          surface: Colors.white,
        ),
        // shadowColor: Colors.black,


        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black), foregroundColor: MaterialStateProperty.all(Colors.white)),
        // ),
        // textButtonTheme: TextButtonThemeData(
        //   style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),
        // ),
        // timePickerTheme: TimePickerThemeData(backgroundColor: Colors.white, entryModeIconColor: Colors.black, hourMinuteTextColor: Colors.black, dayPeriodTextStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}

void main() => runApp(BaseApp());
