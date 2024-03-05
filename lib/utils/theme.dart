import 'package:cotton_plant/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData themeDataLight = ThemeData(
     textTheme: GoogleFonts.openSansTextTheme(),
      appBarTheme: AppBarTheme(
            backgroundColor: CustomColors.primary,
            titleSpacing: 0,
            titleTextStyle: GoogleFonts.openSans(),
          ),
     
    colorScheme: ColorScheme(
      primary: CustomColors.primary,
      tertiary: CustomColors.tertiary, //any text color
      onTertiary: CustomColors.tertiary, //for bottom navigation unselected
      secondary:
          const Color(0xFFEBF2FF), //For calendar view back ground unselected
      onSecondaryContainer:
          const Color.fromARGB(255, 255, 255, 255), //for goal card background
      surface: Colors.black, //any white color
      background: Colors.white,
      error: Colors.red[700]!,
      onPrimary: CustomColors.primary,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: const Color(0xFFFCFCFC), //main scaffold background
      onError: Colors.white,
      brightness: Brightness.light,
      tertiaryContainer:
          const Color(0xFFE4EDFF), //taskscreen goal header timeline card
    ),
  );


  static final ThemeData themeDataDark = ThemeData(
     textTheme: GoogleFonts.openSansTextTheme(),
      appBarTheme: AppBarTheme(
            backgroundColor: CustomColors.primary,
            titleSpacing: 0,
            titleTextStyle: GoogleFonts.openSans(),
          ),
    colorScheme: ColorScheme.dark(
        primary: CustomColors.primary, // Dodger Blue
        tertiary: Colors.white,
        onTertiary: const Color(0xD1D1D1D1),
        primaryContainer: const Color(0x00000040),
        secondary:
            const Color.fromRGBO(170, 170, 170, 0.15), // Tangerine for contrast
        surface: Colors.white,
        background: const Color(0xFF202124),
        error: Colors
            .red[700]!, // We assume this exists in the Material Color Reds
        onPrimary: CustomColors.primary,
        onSecondary: Colors.black,
        onSurface: const Color(0xFF202124),
        onBackground: const Color(0xFF202124),
        onError: Colors.white,
        brightness: Brightness.dark,
        tertiaryContainer: const Color.fromRGBO(170, 170, 170, 0.15),
        onSecondaryContainer: const Color.fromRGBO(170, 170, 170, 0.15)),
  );

}


SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemStatusBarContrastEnforced: true,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

