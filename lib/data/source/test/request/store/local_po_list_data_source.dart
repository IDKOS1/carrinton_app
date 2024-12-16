// data/source/local/request/po/local_po_list_data_source.dart
import 'dart:convert';
import 'package:flutter/services.dart';

abstract class PoListRequest {
  Future<Map<String, dynamic>> getCollectInfo();
}

class LocalPoListDataSource implements PoListRequest {
  final AssetBundle assetBundle;

  LocalPoListDataSource({required this.assetBundle});

  @override
  Future<Map<String, dynamic>> getCollectInfo() async {
    // JSON 파일 로드
    final jsonString = await assetBundle.loadString(
        'lib/data/source/local/mock_json/po/po_list_data_source.json');

    // 테스트용 2초 지연
    await Future.delayed(const Duration(milliseconds: 300));

    // JSON 파싱 후 반환
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}
