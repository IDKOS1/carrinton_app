import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:flutter/material.dart';

class SelectCollectBox extends StatelessWidget {
  final String text;
  final bool isCollectBox;
  final bool selectCollect;
  final VoidCallback onTap;

  const SelectCollectBox(
      {super.key,
      required this.text,
      required this.isCollectBox,
      required this.selectCollect,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: selectCollect ? Colors.transparent : middleGray),
              color: selectCollect
                  ? isCollectBox
                      ? mainColor
                      : waringColor
                  : Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Text(text,
                style: CustomStyle.headMedium(
                    color: selectCollect ? Colors.white : middleGray)),
          )),
    );
  }
}
