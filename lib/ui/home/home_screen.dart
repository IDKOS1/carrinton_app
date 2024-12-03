import 'package:carrinton_app/models/flex_button.dart';
import 'package:carrinton_app/provider/base/selected_index.dart';
import 'package:carrinton_app/service/MockStoreInfo.dart';
import 'package:carrinton_app/ui/base/widgets/row_button.dart';
import 'package:carrinton_app/ui/home/store_detail_screen.dart';
import 'package:carrinton_app/ui/home/widgets/store_information.dart';

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
        RowButton(
          stateProvider: homeIndexProvider,
          buttonList: [
            FlexButton(
                title: 'Morning', onTap: () {}, flex: 4, isClickable: true),
            FlexButton(
                title: 'Afternoon',
                onTap: () {},
                flex: 5,
                isClickable: true),
            FlexButton(title: 'Night ', onTap: () {}, flex: 3, isClickable: true),
            FlexButton(title: 'Pending ', onTap: () {}, flex: 4, isClickable: true)
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
