// import 'package:image_picker/image_picker.dart';
// import 'package:carrinton_app/models/Po_info_model.dart';
//
// class PoDetailState {
//   final PoInfo? PoInfo;
//   final bool isLoaded;
//   final bool isCollected;
//   final XFile? restaurantImage;
//   final XFile? oldJerryCanImage;
//   final XFile? newJerryCanImage;
//
//   PoDetailState({
//     this.PoInfo,
//     this.isLoaded = false,
//     this.isCollected = true,
//     this.restaurantImage,
//     this.oldJerryCanImage,
//     this.newJerryCanImage,
//   });
//
//   // 초기 상태 생성
//   factory PoDetailState.initial() {
//     return PoDetailState();
//   }
//
//   // 상태 복사 (immutable)
//   PoDetailState copyWith({
//     PoInfo? PoInfo,
//     bool? isLoaded,
//     bool? isCollected,
//     XFile? restaurantImage,
//     XFile? oldJerryCanImage,
//     XFile? newJerryCanImage,
//   }) {
//     return PoDetailState(
//       PoInfo: PoInfo ?? this.PoInfo,
//       isLoaded: isLoaded ?? this.isLoaded,
//       isCollected: isCollected ?? this.isCollected,
//       restaurantImage: restaurantImage ?? this.restaurantImage,
//       oldJerryCanImage: oldJerryCanImage ?? this.oldJerryCanImage,
//       newJerryCanImage: newJerryCanImage ?? this.newJerryCanImage,
//     );
//   }
// }
