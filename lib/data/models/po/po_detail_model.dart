import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_detail_model.freezed.dart';

part 'po_detail_model.g.dart';

@freezed
class PoDetailModel with _$PoDetailModel {
  const factory PoDetailModel({
    required int poId,
    required String mainImage,
    required String address,
    required String number,
    required int price,
    required String lastVisitDay,
    required List<String> ownCan,
  }) = _PoDetailModel;

  factory PoDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PoDetailModelFromJson(json);
}
