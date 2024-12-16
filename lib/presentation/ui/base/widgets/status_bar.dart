import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';
import 'package:carrinton_app/presentation/theme/colors.dart';
import 'package:carrinton_app/presentation/theme/text_style.dart';
import 'package:carrinton_app/presentation/ui/base/provider/nav_enum_model.dart';
import 'package:flutter/material.dart';

import 'circle_progress_bar.dart';
import 'collect_info_content.dart';

class CollectStatusBar extends StatelessWidget {
  final Nav page;
  final CollectInfoEntity collectInfo;

  const CollectStatusBar(
      {required this.page, required this.collectInfo, super.key});

  @override
  Widget build(BuildContext context) {
    Widget info;
    // 삼항연산자
    if (page == Nav.home) {
      info = SizedBox(
        key: const ValueKey('home'),
        width: double.infinity,
        child: Wrap(
          runSpacing: 16,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CollectInfoContent(
                title: 'Collected', content: collectInfo.collected.toString()),
            CollectInfoContent(
                title: 'Total', content: collectInfo.totalCollect.toString()),
            CollectInfoContent(
                title: 'Pending', content: collectInfo.pending.toString()),
          ],
        ),
      );
    } else {
      info = SizedBox(
        key: const ValueKey('detail'),
        width: double.infinity,
        child: Wrap(
          runSpacing: 16,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${collectInfo.collected}',
                          style: CustomStyle.headMedium(color: mainColor)),
                      Text(' / ${collectInfo.totalCollect}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16))
                    ],
                  ),
                  const Text(
                    'Collected',
                    style: TextStyle(
                        color: Color(0xFF4C4B4B), fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            CollectInfoContent(
                title: 'Jerry Can', content: collectInfo.jerryCan.toString()),
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${collectInfo.canWeight}',
                        style: CustomStyle.headMedium(),
                      ),
                      const Text(' kg',
                          style: TextStyle(
                              color: Color(0xFF4C4B4B),
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${collectInfo.moveDistance}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                      const Text(' km',
                          style: TextStyle(
                              color: Color(0xFF4C4B4B),
                              fontWeight: FontWeight.w700))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // 뒷배경 그림자
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: shadowColor,
                spreadRadius: 5,
                blurRadius: 20,
              )
            ]),
          ),
        ),
        // 사각형 배경
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                spreadRadius: 5,
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 110,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: info,
                  ),
                ),
              ),
            ],
          ),
        ),

        // 원형 프로그레스바
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: CircleProgressBar(),
        ),
      ],
    );
  }
}
