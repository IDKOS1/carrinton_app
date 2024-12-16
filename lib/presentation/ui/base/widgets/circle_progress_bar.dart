import 'package:carrinton_app/presentation/ui/base/provider/circle_progress_provider.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
