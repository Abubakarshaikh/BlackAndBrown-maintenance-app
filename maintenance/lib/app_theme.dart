import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTheme = TextTheme(
    bodyText1: GoogleFonts.sourceSansPro(
      fontSize: 18,
      color: const Color(0xff1B1B1B),
      fontWeight: FontWeight.w400,
    ),
    bodyText2: GoogleFonts.sourceSansPro(
      fontSize: 18,
      color: const Color(0xff1B1B1B),
      fontWeight: FontWeight.w400,
    ),
    headline1: GoogleFonts.sourceSansPro(
      fontSize:40,
      color: const Color(0xff1B1B1B),
      fontWeight: FontWeight.w600,
    ),
    headline2: GoogleFonts.sourceSansPro(
      fontSize:28,
      color: const Color(0xff1B1B1B),
      fontWeight: FontWeight.w600,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 18,
      color: const Color(0xff1B1B1B),
      fontWeight: FontWeight.w500,
    ),
    caption: GoogleFonts.sourceSansPro(
      fontSize: 18,
      color: Colors.blueGrey.withOpacity(0.5),
      fontWeight: FontWeight.w400,
    ),
    subtitle2: GoogleFonts.sourceSansPro(),
    button: GoogleFonts.poppins(
      fontSize: 18,
      color: const Color(0xff1B1B1B),
      fontWeight: FontWeight.w400,
    ),
  );

  static TextTheme darkTheme = TextTheme(
    bodyText1: GoogleFonts.sora(),
    bodyText2: GoogleFonts.sora(),
    headline1: GoogleFonts.sora(),
    headline2: GoogleFonts.sora(),
    subtitle1: GoogleFonts.sora(
      fontSize: 18,
      color: const Color(0xff1B1B1B),
      fontWeight: FontWeight.w600,
    ),
    subtitle2: GoogleFonts.sora(),
    button: GoogleFonts.sora(),
  );

  static ThemeData light() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: const Color(0xffFFD800))),
      textTheme: lightTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffFFD800),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData();
  }
}
