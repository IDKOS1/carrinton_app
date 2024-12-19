import 'package:carrinton_app/data/models/auth/sign_in_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: "/api/vi/auth")
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST("/sign-in")
  Future<SignInResponseModel> signIn(@Body() Map<String, dynamic> body);
}
