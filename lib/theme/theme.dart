import 'package:flutter/material.dart';
import 'package:veggy/theme/colors.dart';

// Se establece el tema de toda la aplicación 
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    primaryColor: ColorsApp.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: ColorsApp.textPrimaryColor),
    bodyText2: TextStyle(color: ColorsApp.textPrimaryColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}