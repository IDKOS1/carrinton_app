import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/domain/entity/auth/sign_in_entity.dart';
import 'package:carrinton_app/domain/entity/auth/user_info_entity.dart';

abstract class AuthRepository {
  Future<Result<UserInfoEntity>> signIn(SignInEntity signInEntity);
}