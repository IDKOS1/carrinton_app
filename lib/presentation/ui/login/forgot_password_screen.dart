import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/ui/login/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'forgot_password_success_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Forgot Password?',
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
                      'To reset your password, you need your email\nthat can be authenticated',
                      style: TextStyle(
                        color: navy,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 46),
                        child: SvgPicture.asset(
                          'assets/images/forgot_password.svg',
                          width: 118,
                          height: 94,
                        ),
                      ),
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
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(isPassword: false),
                    SizedBox(height: 30),
                    LargeButton(
                        buttonText: 'RESET PASSWORD',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordSuccess()));
                        }),
                    SizedBox(height: 10),
                    LargeButton(
                        buttonText: 'BACK TO LOGIN',
                        backgroundColor: lightGray,
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
