import 'package:carrinton_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentBodyProvider = StateProvider<Widget>((ref) {
  return const HomeScreen(); // 초기 화면 설정
});
