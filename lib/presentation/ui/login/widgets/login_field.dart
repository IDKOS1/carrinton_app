import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/number_field.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/password_field.dart';
import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final String title;
  final bool isPassword;

  const LoginField({super.key, required this.title, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomStyle.boldBodyW600(color: AppColors.mainColor),
        ),
        isPassword ? PasswordField(isPassword: isPassword) : NumberTextField()
      ],
    );
  }
}
