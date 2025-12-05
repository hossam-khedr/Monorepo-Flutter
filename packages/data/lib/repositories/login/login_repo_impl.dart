import 'package:core/constants/api_constants.dart';
import 'package:core/error/faliure.dart';
import 'package:core/utils/api_call_helper.dart';
import 'package:core/utils/cache_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data_soures/remote/login_remote_data_sourse.dart';
import 'package:data/repositories/login/login_repo.dart';

import '../../requests/login_request.dart';

class LoginRepoEmpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepoEmpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, String>> login({
    required LoginRequest loginRequest
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await loginRemoteDataSource.login(
          loginRequest: loginRequest
        );
        final token = response.data['data']['token'];
        final userRole = response.data['data']['user']['role'];
        await CacheHelper.setData(ApiConstants.tokenKey, token);
        print("DATA: $token");
        return userRole;
      },
    );
  }
}
