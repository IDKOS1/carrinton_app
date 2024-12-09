import 'package:carrinton_app/models/flex_button.dart';
import 'package:carrinton_app/presentation/ui/base/widgets/row_button.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/store_detail_screen.dart';
import 'package:carrinton_app/presentation/ui/home/widgets/store_information.dart';
import 'package:carrinton_app/presentation/ui/view_models/base/selected_index.dart';
import 'package:carrinton_app/service/MockStoreInfo.dart';
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            constraints: BoxConstraints(minWidth: 360),
            child: RowButton(
              stateProvider: homeIndexProvider,
              buttonList: [
                FlexButton(
                    title: 'Morning', onTap: () {}, flex: 4, isClickable: true),
                FlexButton(
                    title: 'Afternoon', onTap: () {}, flex: 5, isClickable: true),
                FlexButton(
                    title: 'Night ', onTap: () {}, flex: 3, isClickable: true),
                FlexButton(
                    title: 'Pending ', onTap: () {}, flex: 4, isClickable: true)
              ],
            ),
          ),
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
