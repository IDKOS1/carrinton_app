import 'package:flutter/material.dart';

class CustomStyle {
  static TextStyle appBarTitle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle headMedium({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle boldBody({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bodyMedium({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle bodySmall({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
