import 'package:flutter/material.dart';

class ColorConfig {
  static Color PRIMARY_COLOR = Color(0xff002654);
  static Color ACCENT_COLOR = Color(0xffFEB000);
  static Color WHITE_COLOR = Color(0xFFFBFBFB);
  static Color BLACK_COLOR = ACCENT_COLOR;
  static Color YELLOW_COLOR = Color(0xffffe234);
  static Color AGE_BORDER = Color(0xff006BCD);
  static Color BLACK = Color(0xff000000);
  static Color PRIMARY_SECOND = Color(0xffFEB000);
  static Color GREY = Colors.grey;
  static Color BUTTON_COLOR = Color(0xffCD1127);

  static LinearGradient PRIMARY_GRADIENT = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [PRIMARY_COLOR, ACCENT_COLOR]);
}
