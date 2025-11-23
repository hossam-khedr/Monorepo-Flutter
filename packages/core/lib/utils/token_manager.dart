import 'package:core/constants/api_constants.dart';
import 'package:core/network/dio_clint.dart';
import 'package:core/utils/cache_helper.dart';

class TokenManager {
  TokenManager._internal();

  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() => _instance;

  String? get token => CacheHelper.getString(ApiConstants.tokenKey);

  Future<void> saveNewToken(String newToken) async {
    await CacheHelper.setData(ApiConstants.tokenKey, newToken);
  }

  Future<String?> refreshToken() async {
    final response = await DioHelper.postData(
      url: ApiConstants.refreshEndpoint,
      headers: {"Authorization": "Bearer $token"},
    );

    if(response.statusCode == 200){
      final newToken = response.data['token'] ?? response.data['access_token'];
      if (newToken != null) {
        await saveNewToken(newToken);
        return newToken;
      }  
    }
    return null;
  }

  Future<void> clearToken() async {
    await CacheHelper.removeData(ApiConstants.tokenKey);
  }
}
