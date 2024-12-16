import 'package:carrinton_app/presentation/model/widget/flex_button.dart';
import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/ui/base/widgets/row_button.dart';
import 'package:carrinton_app/presentation/ui/base/provider/selected_index.dart';
import 'package:carrinton_app/presentation/ui/home/po_detail_screen/store_detail_screen.dart';
import 'package:carrinton_app/presentation/ui/home/provider/po_list_provider.dart';
import 'package:carrinton_app/presentation/ui/home/widgets/store_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poListAsync = ref.watch(poListViewModelProvider);

    final poListInfo = poListAsync.when(
      loading: () => null,
      error: (err, stack) => null,
      data: (data) => data,
    );
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            constraints: const BoxConstraints(minWidth: 360),
            child: RowButton(
              stateProvider: homeIndexProvider,
              buttonList: [
                FlexButton(
                    title: 'Morning', onTap: () {}, flex: 4, isClickable: true),
                FlexButton(
                    title: 'Afternoon',
                    onTap: () {},
                    flex: 5,
                    isClickable: true),
                FlexButton(
                    title: 'Night ', onTap: () {}, flex: 3, isClickable: true),
                FlexButton(
                    title: 'Pending ', onTap: () {}, flex: 4, isClickable: true)
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: poListInfo == null
              ? const CircularProgressIndicator(
                  color: mainColor,
                )
              : ListView.builder(
                  itemCount: poListInfo.PoList.length,
                  itemBuilder: (context, index) {
                    final PoInfo = poListInfo.PoList[index];
                    return PoInformation(
                      PoInfo: PoInfo,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PoDetailScreen(PoId: PoInfo.PoId)));
                      },
                    );
                  },
                ),
        )
      ],
    );
  }
}
