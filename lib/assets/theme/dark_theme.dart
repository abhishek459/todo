import 'package:flutter/material.dart';

ThemeData darkTheme() {
  const Color foregroundColor = Color.fromRGBO(245, 251, 239, 1);
  const Color backgroundColor = Color.fromRGBO(24, 31, 28, 1);
  return ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontFamily: 'Lato', fontSize: 25),
      backgroundColor: Color.fromRGBO(123, 75, 148, 1),
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardTheme: CardTheme(
      color: Colors.black.withOpacity(0.3),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: foregroundColor.withOpacity(0.7), width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      textColor: foregroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      hintStyle: const TextStyle(color: foregroundColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: foregroundColor, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      counterStyle: const TextStyle(color: foregroundColor),
      suffixIconColor: foregroundColor,
    ),
    splashColor: backgroundColor,
    hintColor: foregroundColor,
    fontFamily: 'NotoSans',
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: foregroundColor,
        fontFamily: 'NotoSans',
        fontSize: 18,
      ),
    ),
  );
}
