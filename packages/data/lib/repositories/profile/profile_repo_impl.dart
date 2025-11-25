import 'package:core/error/faliure.dart';
import 'package:core/utils/api_call_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data_soures/remote/profile_remote_data_source.dart';
import 'package:data/repositories/profile/profile_repo.dart';
import 'package:data/responses/user/user_response.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource dataSource;
  ProfileRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, UserResponse>> getUserProfile() async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await dataSource.getUserProfile();
        final map = response.data as Map<String, dynamic>;
        final data = UserResponse.fromJson(map);
        return data;
      },
    );
  }
}
