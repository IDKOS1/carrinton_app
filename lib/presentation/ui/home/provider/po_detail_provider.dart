import 'package:carrinton_app/di/di.dart';
import 'package:carrinton_app/domain/entity/po/po_detail_entity.dart';
import 'package:carrinton_app/domain/usecase/po/po_detail_usecase.dart';
import 'package:carrinton_app/presentation/model/po_collected_state.dart';
import 'package:carrinton_app/presentation/ui/home/viewmodel/po_detail_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final poDetailViewModelProvider =
    StateNotifierProvider<PoDetailViewmodel, AsyncValue<PoDetailEntity?>>(
        (ref) {
  final useCase = getIt<PoDetailUseCase>();

  return PoDetailViewmodel(PoDetailUseCase: useCase);
});

// Provider 정의
final poCollectedStateProvider =
    StateNotifierProvider<PoDetailStateNotifier, PoCollectedState>((ref) {
  return PoDetailStateNotifier();
});

class PoDetailStateNotifier extends StateNotifier<PoCollectedState> {
  PoDetailStateNotifier() : super(const PoCollectedState());

  // selectCollected 값을 토글
  void toggleSelectCollected() {
    state = state.copyWith(selectCollected: !state.selectCollected);
  }

  // newJerryList에 항목 추가
  // void addNewJerry(String jerryName) {
  //   final updatedList = [...state.newJerryList, jerryName];
  //   state = state.copyWith(newJerryList: updatedList);
  // }

  // restaurantImage 설정
  void setRestaurantImage(XFile image) {
    state = state.copyWith(restaurantImage: image);
  }

  // restaurantImage 설정
  void setOldJerryCanImage(XFile image) {
    state = state.copyWith(restaurantImage: image);
  }

  // restaurantImage 설정
  void setNewJerryCanImage(XFile image) {
    state = state.copyWith(restaurantImage: image);
  }

  // signature 설정
  void setSignature(XFile signatureImage) {
    state = state.copyWith(signature: signatureImage);
  }
}
