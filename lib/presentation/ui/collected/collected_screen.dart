import 'package:carrinton_app/presentation/model/widget/flex_button.dart';
import 'package:carrinton_app/presentation/ui/base/widgets/row_button.dart';
import 'package:carrinton_app/presentation/ui/base/provider/selected_index.dart';
// import 'package:carrinton_app/data/datasources/local/MockPoInfo.dart';
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
          stateProvider: collectIndexProvider,
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
        const SizedBox(height: 16),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: MockPoInfo.PoList.length,
        //     itemBuilder: (context, index) {
        //       final PoInfo = MockPoInfo.PoList[index];
        //       return PoInformation(
        //         PoInfo: PoInfo,
        //         onPressed: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       PoDetailScreen(PoId: PoInfo.PoId,)));
        //         },
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
