import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/large_button.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/login_field.dart';
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
                    Text(
                      'Forgot Password?',
                      style: CustomStyle.headTitle(color: AppColors.navy),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'To reset your password, you need your email\nthat can be authenticated',
                      style: CustomStyle.bodySmall(color: AppColors.navy),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 46),
                        child: SvgPicture.asset(
                          'assets/images/forgot_password.svg',
                          width: 118,
                          height: 94,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const LoginField(isPassword: false, title: 'Phone',),
                    const SizedBox(height: 30),
                    LargeButton(
                        buttonText: 'RESET PASSWORD',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordSuccess()));
                        }),
                    const SizedBox(height: 10),
                    LargeButton(
                        buttonText: 'BACK TO LOGIN',
                        backgroundColor: AppColors.lightGray,
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
