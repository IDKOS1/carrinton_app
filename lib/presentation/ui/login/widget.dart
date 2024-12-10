import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

// 텍스트를 입력할 수 있는 위젯
class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.isPassword = false,
    this.controller,
  });

  @override
  _CustomTextFieldState createState() {
    return _CustomTextFieldState();
  }
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x1472B614),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 1), // 그림자 위치
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _isObscure : false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure; // 비밀번호 표시/숨기기 토글
                    });
                  },
                )
              : null, // 비밀번호 입력 필드가 아닌 경우 아이콘 없음
          border: InputBorder.none, // 테두리 제거
        ),
      ),
    );
  }
}

// 가로길이 max 버튼
class LargeButton extends StatelessWidget {
  const LargeButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.backgroundColor = mainColor});

  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(fontFamily: 'DMSans', color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
    );
  }
}