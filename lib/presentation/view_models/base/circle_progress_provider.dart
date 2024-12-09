import 'package:flutter_riverpod/flutter_riverpod.dart';

// ProgressNotifier: 상태를 관리하는 클래스
class ProgressNotifier extends StateNotifier<double> {
  ProgressNotifier() : super(66); // 초기값 설정

  // 상태 업데이트 메서드
  void updateProgress(double newProgress) {
    state = newProgress.clamp(0, 100); // 0%에서 100% 범위 내로 제한
  }
}

// Riverpod StateNotifierProvider 정의
final progressNotifierProvider =
    StateNotifierProvider<ProgressNotifier, double>((ref) {
  return ProgressNotifier();
});
