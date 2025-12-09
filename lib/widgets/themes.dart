import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      // titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      // color: Colors.white,
    ),
    textTheme: Theme.of(context).textTheme,
    primarySwatch: Colors.deepPurple,
    // primaryTextTheme: GoogleFonts.latoTextTheme(),
    fontFamily: GoogleFonts.lato().fontFamily,
  );

  static ThemeData dartTheme(BuildContext context) => ThemeData(brightness: Brightness.dark);
}
