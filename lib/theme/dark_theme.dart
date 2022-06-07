import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(123, 75, 148, 1),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(24, 31, 28, 1),
  );
}
