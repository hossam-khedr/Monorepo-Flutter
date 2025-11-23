import 'package:core/constants/api_constants.dart';
import 'package:core/network/dio_clint.dart';
import 'package:data/requests/change_password_request.dart';

class ChangePasswordRemoteDataSource {

  Future<dynamic> changePassword({
    required ChangePasswordRequest request,
  }) async {
    final response = await DioHelper.postData(
      url: ApiConstants.changePasswordEndpoint,
      data: {
        "old_password":request.oldPassword,
        "new_password":request.newPassword
      },
    );
    return response;
  }
}
