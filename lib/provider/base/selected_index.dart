import 'package:flutter_riverpod/flutter_riverpod.dart';

// 전역 selectedIndexProvider
final homeIndexProvider = StateProvider<int>((ref) => 0);

final collectIndxProvider = StateProvider<int>((ref) => 0);