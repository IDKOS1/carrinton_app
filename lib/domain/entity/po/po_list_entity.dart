import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_list_entity.freezed.dart';

@freezed
class PoListEntity with _$PoListEntity {
  const factory PoListEntity({
    required List<PoEntity> PoList,
  }) = _PoListEntity;
}

@freezed
class PoEntity with _$PoEntity {
  const factory PoEntity({
    required int PoId,
    required String title,
    required String location,
    required String number,
    required String operatingTime,
    required double distance,
    required String PoImage,
    required int price,
  }) = _PoEntity;
}
