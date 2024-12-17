import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_list_model.freezed.dart';

part 'po_list_model.g.dart';

@freezed
class PoListModel with _$PoListModel {
  const factory PoListModel({
    required List<PoListModelPoList> poList,
  }) = _PoListModel;

  factory PoListModel.fromJson(Map<String, dynamic> json) =>
      _$PoListModelFromJson(json);
}

@freezed
class PoListModelPoList with _$PoListModelPoList {
  const factory PoListModelPoList({
    required int poId,
    required String title,
    required String location,
    required String number,
    required String operatingTime,
    required double distance,
    required String poImage,
    required int price,
  }) = _PoListModelPoList;

  factory PoListModelPoList.fromJson(Map<String, dynamic> json) =>
      _$PoListModelPoListFromJson(json);
}
