import 'package:flutter/material.dart';

ThemeData darkTheme() {
  const Color foregroundColor = Color.fromRGBO(245, 251, 239, 1);
  const Color backgroundColor = Color.fromRGBO(24, 31, 28, 1);
  return ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontFamily: 'Lato', fontSize: 25),
      backgroundColor: Color.fromRGBO(123, 75, 148, 1),
    ),
    scaffoldBackgroundColor: backgroundColor,
    listTileTheme: const ListTileThemeData(
      textColor: foregroundColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      counterStyle: TextStyle(color: foregroundColor),
      suffixIconColor: foregroundColor,
    ),
    splashColor: backgroundColor,
    hintColor: foregroundColor,
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: foregroundColor,
        fontFamily: 'NotoSans',
        fontSize: 18,
      ),
    ),
  );
}
