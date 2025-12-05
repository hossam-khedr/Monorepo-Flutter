import 'package:core/constants/api_constants.dart';
import 'package:core/network/dio_clint.dart';

import '../../requests/login_request.dart';

class LoginRemoteDataSource {
  Future<dynamic> login({
    required  LoginRequest loginRequest,
  }) async {
    final response = await DioHelper.postData(
      url: ApiConstants.loginEndpoint,
      data: {"national_id": loginRequest.nationalId, "password": loginRequest.password},
      requiresAuth: false
    );
    return response;
  }
}
