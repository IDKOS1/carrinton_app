import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

// 서명 상태 모델
class SignaturePadNotifier extends StateNotifier<ui.Image?> {
  final GlobalKey<SfSignaturePadState> signaturePadKey;

  SignaturePadNotifier(this.signaturePadKey) : super(null);

  void clear() {
    signaturePadKey.currentState?.clear();
    state = null;
  }

  Future<void> save() async {
    // `SfSignaturePad`에서 이미지 생성
    final ui.Image? image = await signaturePadKey.currentState?.toImage();
    state = image; // 상태 업데이트
  }
}

// 서명 상태를 관리하는 Provider
final signaturePadProvider =
StateNotifierProvider.autoDispose<SignaturePadNotifier, ui.Image?>(
      (ref) => SignaturePadNotifier(GlobalKey<SfSignaturePadState>()),
);
