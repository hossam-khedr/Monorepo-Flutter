import 'package:core/constants/api_constants.dart';
import 'package:core/network/dio_clint.dart';

class LoginRemoteDataSource {
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.postData(
      url: ApiConstants.loginEndpoint,
      data: {"email": email, "password": password},
      requiresAuth: false
    );
    return response;
  }
}
