import 'package:carrinton_app/data/models/auth/sign_in_model.dart';
import 'package:carrinton_app/data/models/auth/sign_in_response_model.dart';
import 'package:carrinton_app/data/service/auth_service.dart';

class AuthRemoteRequest {
  final AuthService authService;

  AuthRemoteRequest(this.authService);

  Future<SignInResponseModel> signIn(SignInModel signInModel) async {
    return await authService.signIn(signInModel.toJson());
  }
}
