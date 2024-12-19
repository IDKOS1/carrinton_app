import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatefulWidget {
  final bool isPassword;
  final TextEditingController? controller;

  const PasswordField({
    super.key,
    this.isPassword = false,
    this.controller,
  });

  @override
  _PasswordFieldState createState() {
    return _PasswordFieldState();
  }
}

class _PasswordFieldState extends State<PasswordField> {
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
        keyboardType:
        widget.isPassword ? TextInputType.text : TextInputType.phone,
        inputFormatters: [
          // 숫자와 +만 허용 하는 정규식
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9+]*')),
        ],
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