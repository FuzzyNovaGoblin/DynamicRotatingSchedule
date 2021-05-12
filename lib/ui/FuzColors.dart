import 'package:flutter/material.dart';

class FuzColors {
  static const MaterialColor maincoloralternate = MaterialColor(_maincoloralternatePrimaryValue, <int, Color>{
    50: Color(0xFFE4EFEE),
    100: Color(0xFFBBD6D4),
    200: Color(0xFF8EBBB7),
    300: Color(0xFF619F9A),
    400: Color(0xFF3F8B84),
    500: Color(_maincoloralternatePrimaryValue),
    600: Color(0xFF1A6E66),
    700: Color(0xFF15635B),
    800: Color(0xFF115951),
    900: Color(0xFF0A463F),
  });
  static const int _maincoloralternatePrimaryValue = 0xFF1D766E;

  static const MaterialColor maincoloralternateAccent = MaterialColor(_maincoloralternateAccentValue, <int, Color>{
    100: Color(0xFF7DFFED),
    200: Color(_maincoloralternateAccentValue),
    400: Color(0xFF17FFDF),
    700: Color(0xFF00FCDA),
  });
  static const int _maincoloralternateAccentValue = 0xFF4AFFE6;




  static const MaterialColor maincolor = MaterialColor(_maincolorPrimaryValue, <int, Color>{
    50: Color(0xFFE5F4F3),
    100: Color(0xFFBEE4E1),
    200: Color(0xFF93D3CD),
    300: Color(0xFF67C1B8),
    400: Color(0xFF47B3A9),
    500: Color(_maincolorPrimaryValue),
    600: Color(0xFF229E92),
    700: Color(0xFF1C9588),
    800: Color(0xFF178B7E),
    900: Color(0xFF0D7B6C),
  });
  static const int _maincolorPrimaryValue = 0xFF26A69A;

  static const MaterialColor maincolorAccent = MaterialColor(_maincolorAccentValue, <int, Color>{
    100: Color(0xFFADFFF3),
    200: Color(_maincolorAccentValue),
    400: Color(0xFF47FFE4),
    700: Color(0xFF2DFFE0),
  });
  static const int _maincolorAccentValue = 0xFF7AFFEC;

}
