import 'package:carrinton_app/models/nav_enum_model.dart';
import 'package:carrinton_app/service/MockStoreInfo.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/ui/base/base_screen.dart';
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
    return Column(
      children: [
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
    );
  }
}
