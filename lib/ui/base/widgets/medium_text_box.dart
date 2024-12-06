import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/theme/text_style.dart';
import 'package:flutter/material.dart';

class MediumTextBox extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final int flex;
  final VoidCallback? onTap;

  const MediumTextBox(
      {super.key,
        required this.title,
        this.backgroundColor = Colors.white,
        this.textColor = middleGray,
        this.borderColor = middleGray,
        this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        this.flex = 0,
        this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor ?? middleGray),
            color: backgroundColor ?? Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
              textAlign: TextAlign.center,
            style: CustomStyle.headMedium(color: textColor),
          ),
        ),
      ),
    );
  }
}
