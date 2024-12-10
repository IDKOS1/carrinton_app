import 'package:flutter/material.dart';

class FlexButton {
  final String title;
  final int flex;
  final VoidCallback onTap;
  final bool isClickable;

  FlexButton({
    required this.title,
    this.flex = 1,
    required this.onTap,
    this.isClickable = false
  });
}
