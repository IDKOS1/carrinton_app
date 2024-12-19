import 'package:carrinton_app/data/models/auth/user_info_model.dart';
import 'package:carrinton_app/domain/entity/auth/user_info_entity.dart';

class UserInfoMapper {
  static UserInfoEntity toEntity(UserInfoModel model) {
    return UserInfoEntity(
      name: model.name,
      role: model.role,
      mobileNumber: model.mobileNumber,
      profileImage: model.profileImage,
    );
  }
}
