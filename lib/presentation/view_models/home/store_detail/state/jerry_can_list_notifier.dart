import 'package:flutter_riverpod/flutter_riverpod.dart';

class JerryCanListNotifier extends StateNotifier<List<String>> {
  JerryCanListNotifier() : super(['S.124', 'S.12345', 'S.643', 'S.12', 'S.6256']);

  void addCan(String canNumber) {
    state = [...state, canNumber];
  }

  void removeCan(String canNumber) {
    state = state.where((can) => can != canNumber).toList();
  }
}

final jerryCanListProvider = StateNotifierProvider<JerryCanListNotifier, List<String>>((ref) {
  return JerryCanListNotifier();
});