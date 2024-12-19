import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';

@freezed
class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    required String name,
    required String role,
    required String mobileNumber,
    required String profileImage
  }) = _UserInfoEntity;

  const UserInfoEntity._();
}
