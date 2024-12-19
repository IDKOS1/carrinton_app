import 'package:carrinton_app/data/models/auth/sign_in_model.dart';
import 'package:carrinton_app/domain/entity/auth/sign_in_entity.dart';

class SignInMapper {
  static SignInModel toModel(SignInEntity entity) {
    return SignInModel(
        mobileNumber: entity.mobileNumber, password: entity.password);
  }
}
