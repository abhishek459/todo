import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(123, 75, 148, 1),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(245, 251, 239, 1),
  );
}
