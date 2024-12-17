import 'package:carrinton_app/data/models/collect_info/collect_info_model.dart';
import 'package:carrinton_app/domain/entity/collect_info/collect_info_entity.dart';

class CollectInfoMapper {
  /// Model -> Entity 변환
  static CollectInfoEntity toEntity(CollectInfoModel model) {
    return CollectInfoEntity(
      totalCollect: model.totalCollect,
      collected: model.collected,
      pending: model.pending,
      jerryCan: model.jerryCan,
      canWeight: model.canWeight,
      moveDistance: model.moveDistance,
    );
  }

  /// Entity -> Model 변환
  static CollectInfoModel toModel(CollectInfoEntity entity) {
    return CollectInfoModel(
      totalCollect: entity.totalCollect,
      collected: entity.collected,
      pending: entity.pending,
      jerryCan: entity.jerryCan,
      canWeight: entity.canWeight,
      moveDistance: entity.moveDistance,
    );
  }
}