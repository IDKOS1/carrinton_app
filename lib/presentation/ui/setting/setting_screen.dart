import 'package:carrinton_app/presentation/ui/login/widgets/large_button.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Image.asset('assets/images/carrington_logo.png')),
            const SizedBox(height: 24),
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
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/sample_profile_image.png'),
              ),
            ),
            const Text(
              'Jake',
              style: TextStyle(
                  color: Color(0xFFFF9228),
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            ),
            const Text('CTM',
                style: TextStyle(
                    color: Color(0xFFC6C6C6),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 24),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Version: ',
                      style: TextStyle(
                        color: Color(0xFF4C4B4B),
                        fontSize: 18,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text('1.7.15',
                        style: TextStyle(
                          color: Color(0xFFFF9228),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ))
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'This is latest version. ',
                  style: TextStyle(
                    color: Color(0xFF4C4B4B),
                    fontSize: 18,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 50),
                LargeButton(buttonText: "TRY NOW", onPressed: () {}),
                const SizedBox(height: 20),
                LargeButton(buttonText: "REPORT ERROR", onPressed: () {}),
                const SizedBox(height: 20),
                LargeButton(buttonText: "LOGOUT", onPressed: () {}),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
