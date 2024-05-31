import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFBFBFB);
  static const Color menuBackground = Color(0xFBFBFB);
  static const Color itemsBackground = Color(0xA9A0EA);
  static const Color pageBackground = Color(0xFBFBFB);
  static const Color mainTextColor1 = Colors.black;
  static const Color mainTextColor2 = Colors.black45;
  static const Color mainTextColor3 = Colors.black12;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x13152B);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

class Style {
  static ThemeData light = ThemeData(
    fontFamily: "sfpro",
    textTheme: const TextTheme().apply(
      bodyColor: Colors.pink,
      displayColor: Colors.pink,
    ),
    appBarTheme: const AppBarTheme(centerTitle: true),
    // colorScheme: const ColorScheme(
    //     background: Color(0xFBFBFBFF),
    //     primary: Color(0xA9A0EAFF),
    //     brightness: Brightness.light,
    //     onPrimary: Color(0x624DF0ff),
    //     secondary: Color(0x13152B),
    //     onSecondary: Color(0x0D0E0F),
    //     error: Color(0xF60000),
    //     onError: Color(0xF60000),
    //     onBackground: Color(0xFBFBFB),
    //     surface: Color(0xFBFBFBFF),
    // onSurface: Color(0xFBFBFBFF))
  );
  static ThemeData dark = ThemeData(
      appBarTheme: const AppBarTheme(centerTitle: true),
      colorScheme: const ColorScheme(
          background: Color(0x13152B),
          primary: Color(0xffffff),
          brightness: Brightness.light,
          onPrimary: Color(0xA9A0EA),
          secondary: Color(0x624DF0),
          onSecondary: Color(0x624DF0),
          error: Color(0xF60000),
          onError: Color(0xF60000),
          onBackground: Color(0x13152B),
          surface: Color(0x13152B),
          onSurface: Color(0x13152B)));
}
