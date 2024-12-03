import 'package:flutter_riverpod/flutter_riverpod.dart';

// 전역 selectedIndexProvider
final HomeIndexProvider = StateProvider<int>((ref) => 0);

final CollectIndxProvider = StateProvider<int>((ref) => 0);