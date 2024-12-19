import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';

part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    required String name,
    required String role,
    required String mobileNumber,
    required String profileImage,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
