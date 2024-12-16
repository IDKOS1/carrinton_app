// domain/entity/collect_info_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collect_info_entity.freezed.dart';

@freezed
class CollectInfoEntity with _$CollectInfoEntity {
  const factory CollectInfoEntity({
    required int totalCollect,
    required int collected,
    required int pending,
    required int jerryCan,
    required double canWeight,
    required double moveDistance,
  }) = _CollectInfoEntity;

  const CollectInfoEntity._();
}
