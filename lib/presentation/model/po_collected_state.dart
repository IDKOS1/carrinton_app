import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'po_collected_state.freezed.dart';

@freezed
class PoCollectedState with _$PoCollectedState {
  const factory PoCollectedState({
    @Default(true) bool selectCollected, // 기본값 true
    List<String>? newJerryList, // 기본값 빈 리스트
    XFile? restaurantImage, // nullable
    XFile? oldJerryCanImage, // nullable
    XFile? newJerryCanImage, // nullable
    XFile? signature, // nullable
  }) = _PoCollectedState;
}
