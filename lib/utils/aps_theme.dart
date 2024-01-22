import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SiakadTheme {
  // Colors
  static const Color primaryColor = Color.fromRGBO(57, 73, 171, 1);
  static const Color secondaryColor = Color.fromRGBO(224, 229, 255, 1);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color.fromRGBO(148, 163, 184, 1);
  static const Color dashboard1 = Color.fromRGBO(104, 107, 255, 1);
  static const Color dashboard2 = Color.fromRGBO(255, 176, 35, 1);
  static const Color dashboard3 = Color.fromRGBO(255, 104, 240, 1);

  // Primary Text Theme
  static TextTheme primaryTextTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
      color: primaryColor,
      fontSize: 34,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.3,
    ),
    displayMedium: GoogleFonts.inter(
      color: primaryColor,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.3,
    ),
    displaySmall: GoogleFonts.inter(
      color: white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.3,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.3,
      color: black,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.3,
      color: black,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.3,
      color: primaryColor,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: black,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: black,
    ),
  );

  // Theme Data
  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      primaryTextTheme: primaryTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: primaryTextTheme.bodySmall,
        ),
      ),
    );
  }
}
