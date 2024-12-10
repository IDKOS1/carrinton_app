import 'package:image_picker/image_picker.dart';
import 'package:carrinton_app/models/store_info_model.dart';

class StoreDetailState {
  final StoreInfo? storeInfo;
  final bool isLoaded;
  final bool isCollected;
  final XFile? restaurantImage;
  final XFile? oldJerryCanImage;
  final XFile? newJerryCanImage;

  StoreDetailState({
    this.storeInfo,
    this.isLoaded = false,
    this.isCollected = true,
    this.restaurantImage,
    this.oldJerryCanImage,
    this.newJerryCanImage,
  });

  // 초기 상태 생성
  factory StoreDetailState.initial() {
    return StoreDetailState();
  }

  // 상태 복사 (immutable)
  StoreDetailState copyWith({
    StoreInfo? storeInfo,
    bool? isLoaded,
    bool? isCollected,
    XFile? restaurantImage,
    XFile? oldJerryCanImage,
    XFile? newJerryCanImage,
  }) {
    return StoreDetailState(
      storeInfo: storeInfo ?? this.storeInfo,
      isLoaded: isLoaded ?? this.isLoaded,
      isCollected: isCollected ?? this.isCollected,
      restaurantImage: restaurantImage ?? this.restaurantImage,
      oldJerryCanImage: oldJerryCanImage ?? this.oldJerryCanImage,
      newJerryCanImage: newJerryCanImage ?? this.newJerryCanImage,
    );
  }
}
