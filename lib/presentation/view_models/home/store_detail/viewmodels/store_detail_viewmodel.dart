// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:carrinton_app/presentation/view_models/home/Po_detail/state/Po_detail_state.dart';
// import 'package:image_picker/image_picker.dart';
//
// class PoDetailViewModel extends StateNotifier<PoDetailState> {
//   PoDetailViewModel() : super(PoDetailState.initial());
//
//   // 스토어 상세 정보 불러오기
//   void fetchPoDetail(int PoId) {
//     final PoInfo = MockPoInfo.PoList.firstWhere((po) => po.PoId == PoId);
//     setPoInfo(PoInfo);
//   }
//
//   // 스토어 정보 설정
//   void setPoInfo(PoInfo PoInfo) {
//     state = state.copyWith(
//       PoInfo: PoInfo,
//       isLoaded: true,
//     );
//   }
//
//   // 수집 여부 상태 변경
//   void toggleCollectState() {
//     state = state.copyWith(isCollected: !state.isCollected);
//   }
//
//   // 레스토랑 이미지 설정
//   void setRestaurantImage(XFile? image) {
//     state = state.copyWith(restaurantImage: image);
//   }
//
//   // 오래된 제리캔 이미지 설정
//   void setOldJerryCanImage(XFile? image) {
//     state = state.copyWith(oldJerryCanImage: image);
//   }
//
//   // 새 제리캔 이미지 설정
//   void setNewJerryCanImage(XFile? image) {
//     state = state.copyWith(newJerryCanImage: image);
//   }
// }
//
// // // Provider 정의
// // final PoDetailProvider = StateNotifierProvider.autoDispose<PoDetailViewModel, PoDetailState>((ref) {
// //   return PoDetailViewModel();
// // });
