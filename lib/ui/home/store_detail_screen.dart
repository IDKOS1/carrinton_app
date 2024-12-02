import 'package:carrinton_app/models/store_info_model.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/ui/home/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          title: const Text(
            'TITLE',
            style: TextStyle(
              color: mainColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
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
                                  const Text(
                                    'Edit Photo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
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
                                Text(
                                  storeInfo.title,
                                  style: const TextStyle(
                                    color: mainColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
                                      child: Text(
                                        storeInfo.location,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        softWrap: true, // 자동 줄바꿈 허용
                                        overflow: TextOverflow.visible,
                                      ),
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
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        softWrap: true, // 자동 줄바꿈 허용
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Price : 100MYR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
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
                                  child: const Text(
                                    'Self Declaration Contract',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
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
                  const Text(
                    'Jerry can number at the shop',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumTextBox(
                          title: 'S.08021',
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textColor: orange,
                          borderColor: orange,
                        ),
                        MediumTextBox(
                          title: 'S.08021',
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textColor: orange,
                          borderColor: orange,
                        ),
                        MediumTextBox(
                          title: 'S.08021',
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textColor: orange,
                          borderColor: orange,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                                style: TextStyle(
                                    fontSize: 16,
                                    color: selectCollect
                                        ? Colors.white
                                        : middleGray,
                                    fontWeight: FontWeight.w700)),
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
                                style: TextStyle(
                                    fontSize: 16,
                                    color: selectCollect
                                        ? middleGray
                                        : Colors.white,
                                    fontWeight: FontWeight.w700)),
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
                  if (selectCollect) CollectedScreen() else NoCollectionScreen()
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'COLLECT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
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

class CollectedScreen extends StatefulWidget {
  const CollectedScreen({super.key});

  @override
  State<CollectedScreen> createState() => _CollectedScreenState();
}

class _CollectedScreenState extends State<CollectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weight(kg)',
                style: TextStyle(
                  color: Color(0xFF0B373D),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      '25',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount',
                style: TextStyle(
                  color: Color(0xFF0B373D),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(
                '2,500 MYR',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'New Jerry can number at the shop',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}

class NoCollectionScreen extends StatefulWidget {
  const NoCollectionScreen({super.key});

  @override
  State<NoCollectionScreen> createState() => _NoCollectionScreenState();
}

class _NoCollectionScreenState extends State<NoCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.red,
    );
  }
}
