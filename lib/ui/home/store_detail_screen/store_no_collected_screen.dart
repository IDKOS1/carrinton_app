import 'package:carrinton_app/theme/text_style.dart';
import 'package:flutter/material.dart';

class NoCollectionScreen extends StatelessWidget {
  const NoCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(
              'Please select the reason for not collection.',
              style: CustomStyle.bodyMedium(),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [],
              ),
            )
          ],
        ));
  }
}
