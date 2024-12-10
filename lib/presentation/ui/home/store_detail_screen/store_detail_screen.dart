import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/store_collected_screen.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/store_no_collected_screen.dart';
import 'package:carrinton_app/presentation/ui/util/capture_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carrinton_app/presentation/view_models/home/store_detail/viewmodels/store_detail_viewmodel.dart';
import 'widgets/store_info_widget.dart';
import 'widgets/jerry_can_list.dart';
import 'widgets/select_collected_box.dart';
import 'widgets/signature.dart';

class StoreDetailScreen extends ConsumerWidget {
  final int storeId;

  const StoreDetailScreen({super.key, required this.storeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeDetailState = ref.watch(storeDetailProvider);
    final storeDetailViewModel = ref.read(storeDetailProvider.notifier);

    // Fetch store info if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!storeDetailState.isLoaded) {
        storeDetailViewModel.fetchStoreDetail(storeId);
      }
    });

    // 로딩 상태 확인
    if (!storeDetailState.isLoaded) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('TITLE', style: CustomStyle.appBarTitle(color: mainColor)),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TITLE', style: CustomStyle.appBarTitle(color: mainColor)),
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
                  if (storeDetailState.storeInfo != null)
                    StoreInfoWidget(storeInfo: storeDetailState.storeInfo!)
                  else
                    const SizedBox(), // 기본 빈 위젯
                  const SizedBox(height: 16),
                  Text('Jerry can number at the shop',
                      style: CustomStyle.boldBody()),
                  const SizedBox(height: 8),
                  JerryCanList(
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
                        selectCollect: storeDetailState.isCollected,
                        onTap: storeDetailViewModel.toggleCollectState,
                      ),
                      SizedBox(width: 16),
                      SelectCollectBox(
                        text: 'Not Collected',
                        isCollectBox: false,
                        selectCollect: !storeDetailState.isCollected,
                        onTap: storeDetailViewModel.toggleCollectState,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  storeDetailState.isCollected
                      ? StoreCollectedScreen(
                          price: storeDetailState.storeInfo?.price ?? 0,
                        )
                      : StoreNoCollectedScreen(),
                  const SizedBox(height: 20),
                  Text('Picture', style: CustomStyle.headMedium()),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      constraints: BoxConstraints(
                        minWidth: 400,
                        maxWidth: 600
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CaptureCamera(
                            imageName: 'Restaurant Picture',
                            imageProvider: storeDetailState.restaurantImage,
                            onImagePicked:
                                storeDetailViewModel.setRestaurantImage,
                          ),
                          const SizedBox(width: 8),
                          CaptureCamera(
                            imageName: 'Old Jerry Can',
                            imageProvider: storeDetailState.oldJerryCanImage,
                            onImagePicked:
                                storeDetailViewModel.setOldJerryCanImage,
                          ),
                          const SizedBox(width: 8),
                          CaptureCamera(
                            imageName: 'New Jerry Can',
                            imageProvider: storeDetailState.newJerryCanImage,
                            onImagePicked:
                                storeDetailViewModel.setNewJerryCanImage,
                          ),
                        ],
                      ),
                    ),
                  ),
                  storeDetailState.isCollected
                      ? Signature(
                          description: 'After checking\nPlease sign the PO')
                      : SizedBox(),
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
