import 'package:carrinton_app/models/flex_button.dart';
import 'package:carrinton_app/provider/base/selected_index.dart';
import 'package:carrinton_app/service/MockStoreInfo.dart';
import 'package:carrinton_app/ui/base/widgets/row_button.dart';
import 'package:carrinton_app/ui/home/store_detail_screen/store_detail_screen.dart';
import 'package:carrinton_app/ui/home/widgets/store_information.dart';
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
        RowButton(
          stateProvider: collectIndxProvider,
          buttonList: [
            FlexButton(
                title: 'Collected', onTap: () {}, flex: 2, isClickable: true),
            FlexButton(
                title: 'Not Collected',
                onTap: () {},
                flex: 3,
                isClickable: true),
            FlexButton(title: 'All ', onTap: () {}, flex: 1, isClickable: true)
          ],
        ),
        SizedBox(
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
        ),
      ],
    );
  }
}