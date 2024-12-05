import 'package:carrinton_app/models/collect_info_model.dart';
import 'package:carrinton_app/models/nav_enum_model.dart';
import 'package:carrinton_app/provider/base/circle_progress_provider.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectStatusBar extends StatelessWidget {
  final Nav page;
  final CollectInfo collectInfo;

  const CollectStatusBar(
      {required this.page, required this.collectInfo, super.key});

  @override
  Widget build(BuildContext context) {
    Widget info;
    if (page == Nav.home) {
      info = Container(
        width: double.infinity,
        child: Wrap(
          key: const ValueKey('home'),
          runSpacing: 16,
          alignment: WrapAlignment.spaceBetween,
          children: [
            CollectInfoContent(
                title: 'Collected', content: collectInfo.collected.toString()),
            CollectInfoContent(
                title: 'Total', content: collectInfo.total.toString()),
            CollectInfoContent(
                title: 'Pending', content: collectInfo.pending.toString()),
          ],
        ),
      );
    } else {
      info = Container(
        width: double.infinity,
        child: Wrap(
          runSpacing: 16,
          key: const ValueKey('deail'),
          alignment: WrapAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${collectInfo.collected}',
                          style: const TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                      Text(' / ${collectInfo.total}',
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
            Container(
              width: 80,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${collectInfo.canWeight}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      const Text(' kg',
                          style: TextStyle(
                              color: Color(0xFF4C4B4B),
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
            decoration: BoxDecoration(boxShadow: [
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
              SizedBox(
                width: 110,
              ),
              Expanded(
                child: Container(
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

class CollectInfoContent extends StatelessWidget {
  final String title;
  final String content;

  const CollectInfoContent(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        children: [
          Text('$content',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xFF4C4B4B), fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

// 원형 프로그래스바
class CircleProgressBar extends ConsumerWidget {
  const CircleProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressNotifierProvider);

    return Container(
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        padding: const EdgeInsets.all(12),
        width: 90,
        height: 90,
        child: DashedCircularProgressBar.aspectRatio(
          aspectRatio: 1,
          valueNotifier: ValueNotifier(progress),
          progress: progress,
          startAngle: 180,
          sweepAngle: 360,
          foregroundColor: const Color(0xFF79B12B),
          backgroundColor: const Color(0xFFEEEEEE),
          foregroundStrokeWidth: 10,
          backgroundStrokeWidth: 7,
          animation: true,
          child: Center(
            child: Text(
              '${progress.toInt()}%',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),
        ));
  }
}
