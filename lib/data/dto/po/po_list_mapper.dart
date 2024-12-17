import 'package:carrinton_app/data/models/po/po_list_model.dart';
import 'package:carrinton_app/domain/entity/po/po_list_entity.dart';

class PoListMapper {
  /// Model -> Entity 변환
  static PoListEntity toEntity(PoListModel model) {
    return PoListEntity(
      poList: model.poList.map((poListModel) =>
          PoListMapper._toPoEntity(poListModel)).toList(),
    );
  }

  /// Entity -> Model 변환
  static PoListModel toModel(PoListEntity entity) {
    return PoListModel(
      poList: entity.poList.map((poEntity) =>
          PoListMapper._toPoListModel(poEntity)).toList(),
    );
  }

  /// 개별 항목 변환 (Model -> Entity)
  static PoEntity _toPoEntity(PoListModelPoList model) {
    return PoEntity(
      poId: model.poId,
      title: model.title,
      location: model.location,
      number: model.number,
      operatingTime: model.operatingTime,
      distance: model.distance,
      poImage: model.poImage,
      price: model.price,
    );
  }

  /// 개별 항목 변환 (Entity -> Model)
  static PoListModelPoList _toPoListModel(PoEntity entity) {
    return PoListModelPoList(
      poId: entity.poId,
      title: entity.title,
      location: entity.location,
      number: entity.number,
      operatingTime: entity.operatingTime,
      distance: entity.distance,
      poImage: entity.poImage,
      price: entity.price,
    );
  }
}
