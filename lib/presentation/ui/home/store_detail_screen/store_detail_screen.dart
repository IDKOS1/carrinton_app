import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carrinton_app/models/store_info_model.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/store_no_collected_screen.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/widgets/jerry_can_list.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/widgets/select_collected_box.dart';
import 'package:carrinton_app/presentation/ui/home/store_detail_screen/widgets/signature.dart';
import 'package:carrinton_app/presentation/ui/util/capture_camera.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'store_collected_screen.dart';
import 'widgets/store_info.dart';

// 수집 여부 상태를 관리하기 위한 Provider (초기값은 true)
final selectCollectProvider = StateProvider.autoDispose<bool>((ref) => true);

final restaurantImageProvider =
    StateProvider.autoDispose<XFile?>((ref) => null);
final oldJerryCanImageProvider =
    StateProvider.autoDispose<XFile?>((ref) => null);
final newJerryCanImageProvider =
    StateProvider.autoDispose<XFile?>((ref) => null);

class StoreDetailScreen extends ConsumerWidget {
  final StoreInfo storeInfo;

  const StoreDetailScreen({Key? key, required this.storeInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('TITLE', style: CustomStyle.appBarTitle(color: mainColor)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: mainColor,
              size: 24,
            ),
            onPressed: () {
              // 이전 화면으로 돌아가기
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: mainColor,
                size: 24,
              ),
              onPressed: () {
                // 옵션 다이얼로그 표시
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Options"),
                      content: const Text("You clicked the options button."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // 다이얼로그 닫기
                            Navigator.pop(context);
                          },
                          child: const Text("Close"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 매장 정보를 표시하는 위젯
                      StoreInfoWidget(
                        storeInfo: storeInfo,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // 제리캔 번호 표시 섹션
                      Text('Jerry can number at the shop',
                          style: CustomStyle.boldBody()),
                      const SizedBox(
                        height: 8,
                      ),
                      // 제리캔 목록을 표시하는 위젯
                      JerryCanList(
                        canList: [
                          'S.080245',
                          'S.0802433452',
                          'S.08023453',
                          'S.084',
                          'S.084024',
                          'P.24',
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // 수집 여부 선택 섹션
                      Text(
                        'Please select whether to collect',
                        style: CustomStyle.boldBody(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Consumer(builder: (context, ref, _) {
                          final selectCollect =
                              ref.watch(selectCollectProvider);
                          return Flex(
                            direction: Axis.horizontal,
                            children: [
                              SelectCollectBox(
                                text: 'Collected',
                                isCollectBox: true,
                                selectCollect: selectCollect,
                                onTap: () {
                                  // 수집됨 상태로 변경
                                  ref
                                      .read(selectCollectProvider.notifier)
                                      .state = true;
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SelectCollectBox(
                                text: 'Not Collected',
                                isCollectBox: false,
                                selectCollect: !selectCollect,
                                onTap: () {
                                  // 수집되지 않음 상태로 변경
                                  ref
                                      .read(selectCollectProvider.notifier)
                                      .state = false;
                                },
                              ),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer(builder: (context, ref, _) {
                        final selectCollect = ref.watch(selectCollectProvider);
                        return selectCollect
                            ? CollectedScreen()
                            : NoCollectedScreen();
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      // 사진 섹션 제목 표시
                      Text('Picture', style: CustomStyle.headMedium()),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 350),
                          width: MediaQuery.of(context).size.width - 32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CaptureCamera(
                                imageName: 'Restaurant Picture',
                                imageProvider: restaurantImageProvider,
                              ),
                              const SizedBox(width: 8),
                              CaptureCamera(
                                imageName: 'Old Jerry Can',
                                imageProvider: oldJerryCanImageProvider,
                              ),
                              const SizedBox(width: 8),
                              CaptureCamera(
                                imageName: 'New Jerry Can',
                                imageProvider: newJerryCanImageProvider,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Signature(description: 'After checking\nPlease sign the PO',)
                    ]),
              ),
            ),
            // 화면 하단의 확인 버튼
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
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
                      // 확인 버튼 클릭 시 수행할 동작
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
