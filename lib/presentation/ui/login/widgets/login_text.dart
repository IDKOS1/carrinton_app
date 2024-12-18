import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   'Login',
          //   style: CustomStyle.headTitle(color: AppColors.navy),
          // ),
          // const SizedBox(height: 14),
          Text(
            'Please login to continue.\n'
                'If you don\'t have an account, contact your office '
                'administrator to get started.',
            style: CustomStyle.bodySmall(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
