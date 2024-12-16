import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';

abstract class CollectInfoRepository {
  Future<Result<CollectInfoEntity>> fetchCollectInfo();
}