import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_collected_submit_entity.freezed.dart';


// TODO 추가 프로퍼티 및 이미지 처리 로직 필요
@freezed
class POCollectedSubmitEntity with _$POCollectedSubmitEntity {
  const factory POCollectedSubmitEntity({
    required int PoId,
    required bool isCollected,
    String? mainImage,
    double? weight,
    int? amount,
    List<String>? newJerryCan,

  }) = _POCollectedSubmitEntity;
}
