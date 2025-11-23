import 'package:core/constants/api_constants.dart';
import 'package:core/network/dio_clint.dart';
import 'package:core/utils/cache_helper.dart';

class ProfileRemoteDataSource {

  Future<dynamic> getUserProfile() async {
    final response = await DioHelper.getData(
      url: ApiConstants.profileEndpoint,
    );

    return response;
  }
}
