import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carrinton_app/models/store_info_model.dart';
import 'package:carrinton_app/data/datasources/local/MockStoreInfo.dart';
import 'package:carrinton_app/presentation/view_models/home/store_detail/state/store_detail_state.dart';
import 'package:image_picker/image_picker.dart';

class StoreDetailViewModel extends StateNotifier<StoreDetailState> {
  StoreDetailViewModel() : super(StoreDetailState.initial());

  // 스토어 상세 정보 불러오기
  void fetchStoreDetail(int storeId) {
    final storeInfo = MockStoreInfo.storeList.firstWhere((store) => store.storeId == storeId);
    setStoreInfo(storeInfo);
  }

  // 스토어 정보 설정
  void setStoreInfo(StoreInfo storeInfo) {
    state = state.copyWith(
      storeInfo: storeInfo,
      isLoaded: true,
    );
  }

  // 수집 여부 상태 변경
  void toggleCollectState() {
    state = state.copyWith(isCollected: !state.isCollected);
  }

  // 레스토랑 이미지 설정
  void setRestaurantImage(XFile? image) {
    state = state.copyWith(restaurantImage: image);
  }

  // 오래된 제리캔 이미지 설정
  void setOldJerryCanImage(XFile? image) {
    state = state.copyWith(oldJerryCanImage: image);
  }

  // 새 제리캔 이미지 설정
  void setNewJerryCanImage(XFile? image) {
    state = state.copyWith(newJerryCanImage: image);
  }
}

// Provider 정의
final storeDetailProvider = StateNotifierProvider.autoDispose<StoreDetailViewModel, StoreDetailState>((ref) {
  return StoreDetailViewModel();
});
