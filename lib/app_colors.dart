import 'package:flutter/material.dart';

class AppColors {
  static const secundary = Color(0xff282828);
  static const primary = Color(0xff0084aa);
  static const idea = Color(0xffff7b00);
  static const gray = Color(0xffdcdcdc);
  static const silver = Color(0xff565656);
  static const backgroundBase = Color(0xfff1f1f1);
  static const white = Color(0xffffffff);

  static MaterialColor theme = MaterialColor(0xff282828, _primarySwatch);

  static Map<int, Color> _primarySwatch = {
    50: Color(0xff282828),
    100: Color(0xff282828),
    200: Color(0xff282828),
    300: Color(0xff282828),
    400: Color(0xff282828),
    500: Color(0xff282828),
    600: Color(0xff282828),
    700: Color(0xff282828),
    800: Color(0xff282828),
    900: Color(0xff282828),
  };
}
