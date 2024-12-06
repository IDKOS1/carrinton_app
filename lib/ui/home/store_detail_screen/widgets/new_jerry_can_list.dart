import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewJerryCanList extends StatelessWidget {
  final List<String> canList;

  const NewJerryCanList({super.key, required this.canList});

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
          spacing: 8,
          runSpacing: 16,
          children: canList.map((can) => NewJerryCan(canNumber: can)).toList(),
        ));
  }
}

class NewJerryCan extends StatelessWidget {
  final String canNumber;
  const NewJerryCan({super.key, required this.canNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: orange),
        color: Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            canNumber,
            style: CustomStyle.headMedium(color: orange),
          ),
          SizedBox(width: 2,),
          GestureDetector(
            child: SvgPicture.asset('assets/images/icon_delete.svg'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
