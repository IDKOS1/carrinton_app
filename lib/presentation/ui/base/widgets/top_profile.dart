import 'package:flutter/material.dart';

class TopProfile extends StatelessWidget {
  const TopProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/carrington_logo.png'),
        Row(
          children: [
            const Column(
              children: [
                Text(
                  'Jake',
                  style: TextStyle(
                      color: Color(0xFFFF9228),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text('CTM',
                    style: TextStyle(
                        color: Color(0xFFC6C6C6),
                        fontSize: 14,
                        fontWeight: FontWeight.w700))
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.circle, // 원형 테두리
                border: Border.all(
                  color: Colors.orange, // 테두리 색상
                  width: 1, // 테두리 두께
                ),
              ),
              child: const CircleAvatar(
                radius: 28, // 이미지 크기 (테두리 포함하지 않음)
                backgroundImage:
                AssetImage('assets/images/sample_profile_image.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
