import 'package:carrinton_app/core/error/failures.dart';
import 'package:carrinton_app/core/result.dart';
import 'package:carrinton_app/data/dto/auth/sign_in_mapper.dart';
import 'package:carrinton_app/data/dto/auth/user_info_mapper.dart';
import 'package:carrinton_app/data/models/auth/sign_in_model.dart';
import 'package:carrinton_app/data/models/auth/user_info_model.dart';
import 'package:carrinton_app/data/source/remote/auth_remote_request.dart';
import 'package:carrinton_app/domain/entity/auth/sign_in_entity.dart';
import 'package:carrinton_app/domain/entity/auth/user_info_entity.dart';
import 'package:carrinton_app/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteRequest authRemoteRequest;

  AuthRepositoryImpl(this.authRemoteRequest);

  @override
  Future<Result<UserInfoEntity>> signIn(SignInEntity signInEntity) async {
    try {
      // entity -> model
      final signInModel = SignInMapper.toModel(signInEntity);

      // 로그인 요청, SignInResponseModel 반환
      final responseModel = await authRemoteRequest.signIn(signInModel);

      // 토큰값 추출
      final accessToken = responseModel.accessToken;

      // TODO accessToken secure storage 저장


      // SignInResponseModel -> UserModel
      final userJson = responseModel.toJson().remove('accessToken');
      final userModel = UserInfoModel.fromJson(userJson);

      // UserModel -> UserInfoEntity 반환
      return Success(UserInfoMapper.toEntity(userModel));
    } on FormatException catch (e) {
      return Error(DataSourceFailure('Data format error: $e'));
    } on Exception catch (e) {
      return Error(DataSourceFailure('Failed to fetch collect info: $e'));
    }
  }
}