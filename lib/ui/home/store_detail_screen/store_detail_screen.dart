import 'package:carrinton_app/models/store_info_model.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/theme/text_style.dart';
import 'package:carrinton_app/ui/base/widgets/medium_text_box.dart';
import 'package:carrinton_app/ui/home/store_detail_screen/store_no_collected_screen.dart';
import 'package:carrinton_app/ui/home/widgets/jerry_can_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'store_collected_screen.dart';

class StoreDetailScreen extends StatefulWidget {
  final StoreInfo storeInfo;

  const StoreDetailScreen({super.key, required this.storeInfo});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  bool selectCollect = true;

  @override
  Widget build(BuildContext context) {
    final storeInfo = widget.storeInfo;
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
              // 뒤로가기 동작
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Options"),
                      content: const Text("You clicked the options button."),
                      actions: [
                        TextButton(
                          onPressed: () {
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF3F2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset(storeInfo.storeImage,
                                width: 120, height: 120, fit: BoxFit.cover),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/icon_camera.svg',
                                    width: 18,
                                    height: 18,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Edit Photo',
                                    style: CustomStyle.boldBody(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(storeInfo.title,
                                    style: CustomStyle.headMedium(
                                        color: mainColor)),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Icon(
                                        Icons.location_on_sharp,
                                        size: 14,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(storeInfo.location,
                                          style: CustomStyle.bodySmall()),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.call,
                                          size: 14,
                                        )),
                                    Expanded(
                                      child: Text(
                                        storeInfo.number,
                                        style: CustomStyle.bodySmall(),
                                        softWrap: true, // 자동 줄바꿈 허용
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Price : 100MYR',
                                  textAlign: TextAlign.center,
                                  style: CustomStyle.bodySmall(),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF6C6C),
                                    // 배경 색상
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Self Declaration Contract',
                                    textAlign: TextAlign.center,
                                    style: CustomStyle.boldBody(
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text('Last VIsit Day : dd-mm-yy hh:mm')
                              ]),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Jerry can number at the shop',
                      style: CustomStyle.boldBody()),
                  const SizedBox(
                    height: 8,
                  ),
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
                  Text(
                    'Please select whether to collect',
                    style: CustomStyle.boldBody(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Flex(direction: Axis.horizontal, children: [
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: selectCollect
                                      ? Colors.transparent
                                      : middleGray),
                              color: selectCollect ? mainColor : Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Text('Collected',
                                style: CustomStyle.headMedium(
                                    color: selectCollect
                                        ? Colors.white
                                        : middleGray)),
                          ),
                          onTap: () {
                            setState(() {
                              selectCollect = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: selectCollect
                                      ? middleGray
                                      : Colors.transparent),
                              color: selectCollect ? Colors.white : waringColor,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Text('No Collected',
                                style: CustomStyle.headMedium(
                                    color: selectCollect
                                        ? middleGray
                                        : Colors.white)),
                          ),
                          onTap: () {
                            setState(() {
                              selectCollect = false;
                            });
                          },
                        ),
                      )
                    ]),
                  ),
                  if (selectCollect) CollectedScreen() else NoCollectionScreen(),
                  SizedBox(height: 20,),
                  Text(
                    'Picture', style: CustomStyle.headMedium()
                  ),
                  SizedBox(height: 8,),
                ],
              ),
            )),
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
                    onTap: () {},
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