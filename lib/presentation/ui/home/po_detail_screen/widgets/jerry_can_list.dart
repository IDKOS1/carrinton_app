import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:flutter/material.dart';

class JerryCanList extends StatelessWidget {
  final List<String> canList;

  const JerryCanList({super.key, required this.canList});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: canList.map((can) => JerryCan(canNumber: can)).toList(),
        ));
  }
}

class JerryCan extends StatelessWidget {
  final String canNumber;
  const JerryCan({super.key, required this.canNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.orange),
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        canNumber,
        style: CustomStyle.headMedium(color: AppColors.orange),
        textAlign: TextAlign.center,
      ),
    );
  }
}
