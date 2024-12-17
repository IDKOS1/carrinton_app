// data/source/local/request/collect_info/local_collect_info_data_source.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class CollectInfoRequest {
  final AssetBundle assetBundle;

  CollectInfoRequest({required this.assetBundle});
  var logger = Logger();

  @override
  Future<Map<String, dynamic>> getCollectInfo() async {
    logger.d('CollectInfoRequest 시작');

    // JSON 파일 로드
    final jsonString = await assetBundle.loadString(
        'lib/data/source/test/mock_json/collect_info/collect_info_data_source.json');

    logger.d('json 데이터 불러옴 $jsonString');
    // 테스트용 2초 지연
    await Future.delayed(const Duration(milliseconds: 300));

    // JSON 파싱 후 반환
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}
