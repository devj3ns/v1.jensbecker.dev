import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.montserratTextTheme(
      Theme.of(context).textTheme,
    ),
    primarySwatch: Colors.indigo,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
    ),
  );
}
