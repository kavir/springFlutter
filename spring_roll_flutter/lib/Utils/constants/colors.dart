import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // App Basic Colors
  // static const Color primary = Color(0xFF3D50DF);
  static const Color primary = Color(0xFF35b56b);

  static const Color darkButtonPrimary = Color.fromARGB(255, 0, 0, 0);
  static const Color primaryTransparent = Color(0x803D50DF); // 50% opacity
  // static const Color primary = Color(0xFF186F65);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);
  static const Color purpleLight = Color(0xFFE0E3FA);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Containers Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static const Color darkContainer = Color(0x00ffff1a);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF5669FF);
  static const Color buttonPrimaryTransparent =
      Color(0x805669FF); // 50% opacity

  static const Color buttonRed = Color(0xFFFF2F4E);

  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFC03744);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF120D26);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color white = Colors.white;
  static const Color purple = Color(0xFF9C27B0); // Original purple color
  static const Color purpleTransparent = Color(0x809C27B0); // 50% opacity
  static const Color red = Color(0xFFFF0000); // Original red color
  static const Color redTransparent = Color(0x80FF0000); // 50% opacity
  static const Color yellow = Color(0xFFFFF000); // Original yellow color
  static const Color yellowTransparent = Color(0x80FFF000); // 50% opacity
  static const Color lightYellow = Color(0xFFFFFACD); // Light yellow
  static const Color lightYellowTransparent = Color(0x80FFFACD); // 50% opacity
  static const Color gold = Color(0xFFFFD700); // Gold
  static const Color goldTransparent = Color(0x80FFD700); // 50% opacity
  static const Color amber = Color(0xFFFFBF00); // Amber
  static const Color amberTransparent = Color(0x80FFBF00); // 50% opacity
  static const Color canaryYellow = Color(0xFFFFEF00); // Canary yellow
  static const Color canaryYellowTransparent = Color(0x80FFEF00); // 50% opacity
  static const Color lightGreen = Color(0xFF90EE90); // Light green
  static const Color lightGreenTransparent = Color(0x8090EE90); // 50% opacity
  static const Color limeGreen = Color(0xFF32CD32); // Lime green
  static const Color limeGreenTransparent = Color(0x8032CD32); // 50% opacity
  static const Color forestGreen = Color(0xFF228B22); // Forest green
  static const Color forestGreenTransparent = Color(0x80228B22); // 50% opacity
  static const Color oliveGreen = Color(0xFF6B8E23); // Olive green
  static const Color oliveGreenTransparent = Color(0x806B8E23); // 50% opacity
  static const Color seaGreen = Color(0xFF2E8B57); // Sea green
  static const Color seaGreenTransparent = Color(0x802E8B57); // 50% opacity
  static const Color deepBlueTransparent = Color(0x800033A0); // 50% opacity
  static const Color charcoalGreyTransparent = Color(0x80333333); // 50% opacity

  // form
  static const Color inputFormBorderGrey = Color(0xFFE4DFDF);

  // booking subtitle
  static const Color noBookingSubtitle = Color(0xFF747688);

  // rating background box
  static const Color bgRatingBox = Color(0xFFF8F8F8);

  // direction button
  static const Color getDirecitonButton = Color(0xFF232536);

  static const Color greyFigma = Color(0xFF747688);

  static const Color radioColor = Color(0xFF0064D2);

  static const Color darkGreyFigma = Color(0xFF807A7A);

  static const Color figmaSubtitleColor = Color(0xFF808080);

  static Color themeColorApp = Colors.grey.shade50;
}
