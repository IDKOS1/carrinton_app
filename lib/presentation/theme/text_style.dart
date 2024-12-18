import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStyle {
  static TextStyle appBarTitle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle headTitle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 30.sp,
      fontWeight: FontWeight.w700
    );
  }

  static TextStyle headMedium({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle boldBody({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle boldBodyW600({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bodyLarge({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle bodyMedium({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bodySmall({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
