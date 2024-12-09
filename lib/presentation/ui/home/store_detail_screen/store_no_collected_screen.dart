import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/theme/text_style.dart';
import 'package:flutter/material.dart';

class NoCollectedScreen extends StatelessWidget {
  const NoCollectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please select the reason for not collection.',
              textAlign: TextAlign.start,
              style: CustomStyle.bodyMedium(),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.transparent),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RejectReason(rejectReason: 'No Oil'),
                      SizedBox(width: 8,),
                      RejectReason(rejectReason: 'Little Oil'),
                      SizedBox(width: 8,),
                      RejectReason(rejectReason: 'Shop Closed'),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RejectReason(rejectReason: 'Price\nproblem'),
                      SizedBox(width: 8,),
                      RejectReason(rejectReason: 'Rejected\nOur offer'),
                      SizedBox(width: 8,),
                      RejectReason(rejectReason: 'Other')
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class RejectReason extends StatelessWidget {
  final String rejectReason;

  const RejectReason({super.key, required this.rejectReason});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: orange),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            rejectReason,
            style: CustomStyle.headMedium(color: orange),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
