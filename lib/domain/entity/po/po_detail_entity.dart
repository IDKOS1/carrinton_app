import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_detail_entity.freezed.dart';

@freezed
class PoDetailEntity with _$PoDetailEntity {
  const factory PoDetailEntity({
    required int poId,
    required String poName,
    required String mainImage,
    required String address,
    required String number,
    required int price,
    required String lastVisitDay,
    required List<String> ownCan,
  }) = _PoDetailEntity;
}
