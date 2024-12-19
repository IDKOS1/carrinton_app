import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login_screen.dart';

class ForgotPasswordSuccess extends StatelessWidget {
  const ForgotPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Successfully',
                style: CustomStyle.headTitle(color: AppColors.navy),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'We have sent you a password reset SMS. Please follow\n'
                'the instructions in the email to reset your password.',
                style: CustomStyle.bodySmall(color: AppColors.navy),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 70),
                  child: SvgPicture.asset(
                    'assets/images/forgot_password_success.svg',
                    width: 118,
                    height: 94,
                  ),
                ),
              ),
              LargeButton(
                  buttonText: 'OK',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (_) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
