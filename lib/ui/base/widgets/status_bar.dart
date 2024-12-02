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
      info = Row(
        key: const ValueKey('home'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 80),
          CollectInfoContent(
              title: 'Collected', content: collectInfo.collected.toString()),
          CollectInfoContent(
              title: 'Total', content: collectInfo.total.toString()),
          CollectInfoContent(
              title: 'Pending', content: collectInfo.pending.toString()),
        ],
      );
    } else {
      info = Row(
        key: const ValueKey('deail'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 80),
          Container(
            width: 80,
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
      );
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // 원형 그림자 배경 설정
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
              ],
            ),
            width: 90,
            height: 90,
          ),
        ),
        Container(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: info),
          ),
        ),
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
      width: 80,
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
        padding: const EdgeInsets.all(12),
        width: 90,
        height: 90,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
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
