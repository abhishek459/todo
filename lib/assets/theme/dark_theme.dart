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
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      counterStyle: const TextStyle(color: foregroundColor),
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
