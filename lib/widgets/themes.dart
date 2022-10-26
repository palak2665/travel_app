import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          elevation: 0.0,
        ),
        primaryColor: const Color(0xff131217).withOpacity(0.9),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.grey,
            fontSize: 13.0,
          ),
          headline2: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      );
}
