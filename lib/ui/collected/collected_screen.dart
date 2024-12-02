import 'package:carrinton_app/models/nav_enum_model.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/ui/base/base_screen.dart';
import 'package:carrinton_app/ui/home/widget.dart';
import 'package:flutter/material.dart';

class CollectedScreen extends StatefulWidget {
  const CollectedScreen({super.key});

  @override
  State<CollectedScreen> createState() => _CollectedScreenState();
}

class _CollectedScreenState extends State<CollectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumTextBox(
              title: 'Collected',
              backgroundColor: mainColor,
              textColor: Colors.white,
              borderColor: Colors.transparent,
            ),
            SizedBox(width: 8,),
            MediumTextBox(title: 'Not Collected'),
            SizedBox(width: 8,),
            MediumTextBox(title: 'ALL'),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Placeholder()
      ],
    );
  }
}
