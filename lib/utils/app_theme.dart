import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
  useMaterial3: true,
  inputDecorationTheme: inputeDecoration,
);

final darkTheme = ThemeData(
  inputDecorationTheme: inputeDecoration,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);

//Comman Theme
InputDecorationTheme inputeDecoration = InputDecorationTheme(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: const BorderSide(color: Colors.grey),
  ),
);
