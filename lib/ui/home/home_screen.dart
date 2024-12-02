import 'package:carrinton_app/service/MockStoreInfo.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/ui/home/store_detail_screen.dart';
import 'package:carrinton_app/ui/home/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
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
                        backgroundImage: AssetImage(
                            'assets/images/sample_profile_image.png'),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                // 원형 그림자 배경 설정
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor,
                          spreadRadius: 5,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    width: 90,
                    height: 90,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      const BoxShadow(
                        color: shadowColor,
                        spreadRadius: 5,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 80),
                        LoadAmount(title: 'Collected', amount: 20),
                        LoadAmount(title: 'Total', amount: 62),
                        LoadAmount(title: 'pending', amount: 2),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CircleProgressBar(),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MediumTextBox(
                  title: 'Morning',
                  backgroundColor: mainColor,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
                MediumTextBox(title: 'Afternoon'),
                MediumTextBox(title: 'Night'),
                MediumTextBox(title: 'Pending'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: MockStoreInfo.storeList.length,
                itemBuilder: (context, index) {
                  final storeInfo = MockStoreInfo.storeList[index];
                  return StoreInformation(
                    storeInfo: storeInfo,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StoreDetailScreen(storeInfo: storeInfo)));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
