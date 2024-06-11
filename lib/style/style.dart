import 'package:flutter/material.dart';


List<Color> colorArray = [ 
  Color.fromARGB(255, 172, 160, 240), //GREEN 
  Color.fromARGB(255, 133, 112, 253), //RED 
  Color.fromARGB(255, 71, 70, 76),//black


  Color.fromARGB(255, 31, 32, 37),
  Color(0xFF303F9F), // DARK INDIGO 
  Color(0xFF536DFE), // INDIGO ACCENT 


  Color.fromARGB(255, 109, 107, 117), // BLACK INDIGO 
  Color.fromARGB(188, 97, 12, 255), // BLUE 
  Color.fromARGB(255, 0, 0, 0), //TEAL  
];
class AppColors {
  static const Color primary = Color(0xFBFBFB);
  static const Color menuBackground = Color.fromARGB(255, 255, 255, 255);
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
     colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromRGBO(255, 255, 255, 1),
        primary: Color.fromARGB(255, 0, 0, 0),
    // colorScheme: const ColorScheme(
    //     background: Colors.white,
    //     primary: Color.fromARGB(169, 255, 255, 255),
    //     brightness: Brightness.light
    //     onPrimary: Color.fromARGB(97, 0, 0, 0),
    //     secondary: Color(0x13152B),
    //     onSecondary: Color(0x0D0E0F),
    //     error: Color.fromARGB(0, 255, 31, 31),
    //     onError: Color(0xF60000),
    //     onBackground: Color(0xA9A0EA),
    //     surface: Color.fromARGB(249, 255, 255, 255),
    // onSurface: Color.fromARGB(250, 0, 0, 0)
    )
  );
  static ThemeData dark = ThemeData(
      appBarTheme: const AppBarTheme(centerTitle: true),
      colorScheme: const ColorScheme(
          // background: Color(0x13152B),
          // primary: Color(0xffffff),
          // brightness: Brightness.light,
          // onPrimary: Color(0xA9A0EA),
          // secondary: Color(0x624DF0),
          // onSecondary: Color(0x624DF0),
          // error: Color(0xF60000),
          // onError: Color(0xF60000),
          // onBackground: Color(0x13152B),
          // surface: Color(0x13152B),
          // onSurface: Color(0x13152B)));

          brightness: Brightness.light,
          primary: Color(0xffb39ddb),
          onPrimary: Color(0xff121014),
          primaryContainer: Color(0xff7e57c2),
          onPrimaryContainer: Color(0xfff3edfe),
          secondary: Color(0xff40c4ff),
          onSecondary: Color(0xff091314),
          secondaryContainer: Color(0xff0179b6),
          onSecondaryContainer: Color(0xffdff2fc),
          tertiary: Color(0xff80d8ff),
          onTertiary: Color(0xff0e1414),
          tertiaryContainer: Color(0xff00497b),
          onTertiaryContainer: Color(0xffdfebf3),
          error: Color(0xffcf6679),
          onError: Color(0xff140c0d),
          errorContainer: Color(0xffb1384e),
          onErrorContainer: Color(0xfffbe8ec),
          background: Color(0xff1a191c),
          onBackground: Color(0xffedeced),
          surface: Color(0xff1a191c),
          onSurface: Color(0xffedeced),
          surfaceVariant: Color(0xff242128),
          onSurfaceVariant: Color(0xffdcdcdd),
          outline: Color(0xffa39da3),
          shadow: Color(0xff000000),
          inverseSurface: Color(0xfffaf9fc),
          onInverseSurface: Color(0xff131313),
          inversePrimary: Color(0xff5c536d),
          surfaceTint: Color(0xffb39ddb)));
}
