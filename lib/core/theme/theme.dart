import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData ostelloTheme = ThemeData(
  primaryColor: const Color.fromRGBO(125, 35, 224, 1),
  primarySwatch: const MaterialColor(0xFF6B38FB, {
    50: Color(0xFFF0E7FF),
    100: Color(0xFFDBC2FF),
    200: Color(0xFFC497FF),
    300: Color(0xFFA86CFF),
    400: Color(0xFF8D42FB),
    500: Color(0xFF6B38FB),
    600: Color(0xFF5930E0),
    700: Color(0xFF471CB6),
    800: Color(0xFF36128D),
    900: Color(0xFF220763),
  }),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: GoogleFonts.poppins(
        color: ColorSchemeOstello.colorScheme.primary,
        fontSize: 24,
        fontWeight: FontWeight.w700),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  textTheme: TextThemeOstello.textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6B38FB),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textStyle: GoogleFonts.averiaSansLibre(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF5F5F5),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    hintStyle: GoogleFonts.averiaSansLibre(color: Colors.grey),
  ),
  colorScheme: ColorSchemeOstello.colorScheme,
);

class ColorSchemeOstello {
  static final colorScheme = ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromRGBO(125, 35, 224, 1),
    secondary: const Color(0xFF00C853),
    surface: const Color(0xFFF5F5F5),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black87,
  );
}

class TextThemeOstello {
  static final textTheme = TextTheme(
      bodyLarge: GoogleFonts.sen(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        fontSize: 20
        ,
      ),
      bodyMedium: GoogleFonts.sen(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.sen(
        color: const Color.fromRGBO(156, 156, 156, 1),
        fontWeight: FontWeight.w400,
        fontSize: 11,
      ),
      titleLarge: GoogleFonts.sen(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      titleMedium: GoogleFonts.sen(
        color: const Color.fromRGBO(156, 156, 156, 1),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      labelMedium: GoogleFonts.sen(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        fontSize: 16,
      ),
      labelSmall: GoogleFonts.sen(
        color: Color.fromRGBO(76, 68, 82, 1),
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        fontSize: 14,
      ));
}
