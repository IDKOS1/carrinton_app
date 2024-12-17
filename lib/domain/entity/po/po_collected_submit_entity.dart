import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_collected_submit_entity.freezed.dart';


// TODO 추가 프로퍼티 및 이미지 처리 로직 필요
@freezed
class PoCollectedSubmitEntity with _$PoCollectedSubmitEntity {
  const factory PoCollectedSubmitEntity({
    required int PoId,
    required bool isCollected,
    String? mainImage,
    double? weight,
    int? amount,
    List<String>? newJerryCan,

  }) = _PoCollectedSubmitEntity;
}
