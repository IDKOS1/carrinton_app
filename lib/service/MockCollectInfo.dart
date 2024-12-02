import 'package:carrinton_app/models/collect_info_model.dart';

class MockCollectInfo {
  static final CollectInfo collectInfo = CollectInfo.fromJson({
    "total": 60,
    "collected": 40,
    "pending": 20,
    "jerryCan": 10,
    "canWeight": 15.5,
    "moveDistance": 120.0
  });
}
