import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontThemes {
  static TextStyle _baseStyle({
    required double size,
    required FontWeight weight,
    Color? color,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.lato(
      fontSize: size,
      fontWeight: weight,
      color: color,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle titleSmall({Color? color, FontWeight? weight}) => _baseStyle(
    size: 15, 
    weight: weight ?? FontWeight.w600, 
    color: color
  );
  static TextStyle titleMedium({Color? color, FontWeight? weight}) => _baseStyle(
    size: 16, 
    weight: weight ?? FontWeight.w500, 
    color: color
  );
  static TextStyle titleMediumBold({Color? color}) => _baseStyle(
    size: 16, 
    weight: FontWeight.bold, 
    color: color
  );
  static TextStyle titleLarge({Color? color, FontWeight? weight}) => _baseStyle(
    size: 18, 
    weight: weight ?? FontWeight.w500, 
    color: color
  );


  static TextStyle bodySmall({Color? color, FontWeight? weight}) => _baseStyle(
    size: 11, 
    weight: weight ?? FontWeight.w400, 
    color: color
  );
  static TextStyle bodyMedium({Color? color, FontWeight? weight}) => _baseStyle(
    size: 12, 
    weight: weight ?? FontWeight.w400, 
    color: color
  );
  static TextStyle bodyLarge({Color? color, FontWeight? weight}) => _baseStyle(
    size: 14, 
    weight: weight ?? FontWeight.w400, 
    color: color
  );
}
