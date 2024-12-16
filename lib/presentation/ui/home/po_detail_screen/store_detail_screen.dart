import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/home/po_detail_screen/po_collected_screen.dart';
import 'package:carrinton_app/presentation/ui/home/po_detail_screen/store_no_collected_screen.dart';
import 'package:carrinton_app/presentation/ui/home/po_detail_screen/widgets/store_info_widget.dart';
import 'package:carrinton_app/presentation/ui/home/provider/po_detail_provider.dart';
import 'package:carrinton_app/presentation/ui/util/capture_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/jerry_can_list.dart';
import 'widgets/select_collected_box.dart';
import 'widgets/signature.dart';

class PoDetailScreen extends ConsumerWidget {
  final int PoId;

  const PoDetailScreen({super.key, required this.PoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(poCollectedStateProvider);
    final notifier = ref.read(poCollectedStateProvider.notifier);

    final poDetailAsync = ref.watch(poDetailViewModelProvider);
    final poDetailInfo = poDetailAsync.when(
      loading: () => null,
      error: (err, stack) => null,
      data: (data) => data,
    );

    // 로딩 상태 확인
    if (poDetailInfo == null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('TITLE', style: CustomStyle.appBarTitle(color: mainColor)),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('TITLE', style: CustomStyle.appBarTitle(color: mainColor)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: mainColor, size: 24),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    PoInfoWidget(PoInfo: poDetailInfo),
                    const SizedBox(height: 16),
                    Text('Jerry can number at the shop',
                        style: CustomStyle.boldBody()),
                    const SizedBox(height: 8),
                    const JerryCanList(
                        canList: ['S.12', 'S.8922', 'S.12825', 'S.1285']),
                    const SizedBox(height: 20),
                    Text('Please select whether to collect',
                        style: CustomStyle.boldBody()),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SelectCollectBox(
                          text: 'Collected',
                          isCollectBox: true,
                          selectCollect: state.selectCollected,
                          onTap: notifier.toggleSelectCollected,
                        ),
                        const SizedBox(width: 16),
                        SelectCollectBox(
                          text: 'Not Collected',
                          isCollectBox: false,
                          selectCollect: !state.selectCollected,
                          onTap: notifier.toggleSelectCollected,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    state.selectCollected
                        ? PoCollectedScreen(
                            price: poDetailInfo.price,
                          )
                        : const PoNoCollectedScreen(),
                    const SizedBox(height: 20),
                    Text('Picture', style: CustomStyle.headMedium()),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        constraints:
                            const BoxConstraints(minWidth: 400, maxWidth: 600),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CaptureCamera(
                              imageName: 'Restaurant Picture',
                              image: state.restaurantImage,
                              onImagePicked: notifier.setRestaurantImage,
                            ),
                            const SizedBox(width: 8),
                            CaptureCamera(
                              imageName: 'Old Jerry Can',
                              image: state.oldJerryCanImage,
                              onImagePicked: notifier.setOldJerryCanImage,
                            ),
                            const SizedBox(width: 8),
                            CaptureCamera(
                              imageName: 'New Jerry Can',
                              image: state.newJerryCanImage,
                              onImagePicked: notifier.setNewJerryCanImage,
                            ),
                          ],
                        ),
                      ),
                    ),
                    state.selectCollected
                        ? const Signature(
                            description: 'After checking\nPlease sign the PO')
                        : const SizedBox(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 10,
                      offset: Offset(0, -4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: GestureDetector(
                    child: Container(
                      width: 287,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Center(
                        child: Text(
                          'CONFIRM',
                          textAlign: TextAlign.center,
                          style: CustomStyle.headMedium(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Handle confirm action
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
