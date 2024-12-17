// data/source/local/request/po/local_po_list_data_source.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class PoListRequest {
  final AssetBundle assetBundle;
  var logger = Logger();

  PoListRequest({required this.assetBundle});

  Future<Map<String, dynamic>> getPoList() async {

    // JSON 파일 로드
    final jsonString = await assetBundle.loadString(
        'lib/data/source/test/mock_json/po/po_list_data_source.json');

    // 테스트용 2초 지연
    await Future.delayed(const Duration(milliseconds: 800));

    // JSON 파싱 후 반환
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}
