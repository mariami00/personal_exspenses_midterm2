import 'package:flutter/material.dart';

class Themes {
  Color _lightBlue = Colors.lightBlue;
  Color _tealAccent = Colors.tealAccent;

  ThemeData buildTheme() {
    return ThemeData(
      primaryColor: _tealAccent,
      buttonTheme: ButtonThemeData(
        buttonColor: _lightBlue,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        minWidth: 120,
        height: 40.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}