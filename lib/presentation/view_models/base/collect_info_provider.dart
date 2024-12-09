import 'package:carrinton_app/models/models/collect_info_model.dart';
import 'package:carrinton_app/service/MockCollectInfo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectInfoState extends StateNotifier<CollectInfo> {
  CollectInfoState() : super(MockCollectInfo.collectInfo);
}

final collectInfoProvider = StateNotifierProvider<CollectInfoState, CollectInfo>((ref) {
  return CollectInfoState();
});