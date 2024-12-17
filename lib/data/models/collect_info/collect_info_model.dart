// data/models/collect_info_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collect_info_model.freezed.dart';

part 'collect_info_model.g.dart';

@freezed
class CollectInfoModel with _$CollectInfoModel {
  const factory CollectInfoModel({
    required int totalCollect,
    required int collected,
    required int pending,
    required int jerryCan,
    required double canWeight,
    required double moveDistance,
  }) = _CollectInfoModel;

  factory CollectInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CollectInfoModelFromJson(json);
}
