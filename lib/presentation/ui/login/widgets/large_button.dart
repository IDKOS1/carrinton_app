import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:flutter/material.dart';

// 가로길이 max 버튼
class LargeButton extends StatelessWidget {
  const LargeButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.backgroundColor = AppColors.mainColor});

  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            buttonText,
            style: CustomStyle.boldBody(color: Colors.white),
          )),
    );
  }
}
