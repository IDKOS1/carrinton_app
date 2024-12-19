import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/bottom_nav_bar.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/large_button.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/login_field.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/login_text.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/number_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/recycle_ledger_logo_2.png',
                      height: 110.h,
                      width: 400.w,
                    ),
                    const LoginText(),
                    const LoginField(title: 'Phone', isPassword: false),
                    SizedBox(height: 18.h),
                    const LoginField(title: 'PIN', isPassword: true),
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
                                color: AppColors.middleGray, // 테두리 색상
                                width: 2, // 테두리 두께
                              ),
                              activeColor: AppColors.mainColor,
                            ),
                            Text(
                              'Remember me',
                              style: CustomStyle.bodyMedium(
                                  color: AppColors.middleGray),
                            ),
                          ],
                        ),
                        TextButton(
                            child: Text(
                              'Forgot Password?',
                              style: CustomStyle.bodyMedium(),
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
                    SizedBox(height: 30.h),
                    LargeButton(
                      buttonText: 'Login',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavBar()));
                      },
                    )
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
