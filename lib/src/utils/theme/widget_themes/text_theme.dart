


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub/src/constants/colors.dart';

class MarketHubTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: marketHubDarkColor),
      displayMedium: GoogleFonts.montserrat(fontSize: 20.0, fontWeight: FontWeight.w700, color: marketHubDarkColor),
      displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: marketHubDarkColor),
      headlineMedium: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: marketHubDarkColor),
      titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: marketHubDarkColor),
      bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: marketHubDarkColor),
      bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: marketHubDarkColor),
      headlineSmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.bold, color: marketHubDarkColor),
  );
      

  static TextTheme darkTextTheme = TextTheme(
    // headline1, headline2, headline3, headline4, headline6, bodyText1, bodyText2
      displayLarge: GoogleFonts.montserrat(fontSize: 28.0, fontWeight: FontWeight.bold, color: marketHubWhiteColor),
      displayMedium: GoogleFonts.montserrat(fontSize: 24.0, fontWeight: FontWeight.w700, color: marketHubWhiteColor),
      displaySmall: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w700, color: marketHubWhiteColor),
      headlineMedium: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: marketHubWhiteColor),
      titleLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, color: marketHubWhiteColor),
      bodyLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: marketHubWhiteColor),
      bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: marketHubWhiteColor),
      headlineSmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.bold, color: marketHubWhiteColor),

  );

}