import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/ui/bottom_nav_bar.dart';
import 'package:carrinton_app/ui/home/home_screen.dart';
import 'package:carrinton_app/ui/login/widget.dart';
import 'package:flutter/material.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Login',
                    style: TextStyle(
                        color: navy,
                        fontSize: 30,
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    'Please log in to continue.\n'
                    'If you don\'t have an account, contact your office\n'
                    'administrator to get started.',
                    style: TextStyle(
                      color: navy,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Phone',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const CustomTextField(isPassword: false),
                  const SizedBox(
                    height: 18,
                  ),
                  const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'PIN',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const CustomTextField(isPassword: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                            ),
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            side: const BorderSide(
                              color: middleGray, // 테두리 색상
                              width: 2, // 테두리 두께
                            ),
                            activeColor: mainColor,
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(color: middleGray),
                          ),
                        ],
                      ),
                      TextButton(
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontFamily: 'DMSans', color: mainColor),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LargeButton(
                    buttonText: 'Login',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
