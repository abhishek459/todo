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
    listTileTheme: const ListTileThemeData(
      textColor: foregroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: foregroundColor),
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
