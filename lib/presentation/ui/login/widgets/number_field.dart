import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/ui/login/widgets/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberTextField extends StatelessWidget {
  final TextEditingController? controller;

  const NumberTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1472B614),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 1), // 그림자 위치
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CountryPicker(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: VerticalDivider(
              thickness: 1,
              color: AppColors.middleGray,
              width: 10.w,
            ),
          ),
          Expanded(
            child: Center(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9+]*')),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}