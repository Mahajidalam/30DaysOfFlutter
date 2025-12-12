import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    cardColor: Colors.white,
    canvasColor: creamColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      // titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      // color: Colors.white,
      foregroundColor: darkBuishColor,
      surfaceTintColor: darkBuishColor,
    ),
    textTheme: Theme.of(context).textTheme,
    primarySwatch: Colors.deepPurple,
    // primaryTextTheme: GoogleFonts.latoTextTheme(),
    // fontFamily: GoogleFonts.lato().fontFamily,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static ThemeData dartTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0.0,
      foregroundColor: lightBuishColor,
      surfaceTintColor: Colors.white,
      // titleTextStyle: TextStyle(color: Colors.white),
    ),
    textTheme: Theme.of(
      context,
    ).textTheme
    .copyWith(headlineMedium: context.textTheme.headlineMedium!.copyWith(color: Colors.white)),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  // Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBuishColor = Color(0xff403b58);
  static Color lightBuishColor = Vx.indigo500;
}
