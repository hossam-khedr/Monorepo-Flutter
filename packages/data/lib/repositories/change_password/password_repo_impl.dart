import 'package:core/error/faliure.dart';
import 'package:core/utils/api_call_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data_soures/remote/change_password_remote_data_source.dart';
import 'package:data/repositories/change_password/password_repo.dart';
import 'package:data/requests/change_password_request.dart';

class PasswordRepoImpl implements PasswordRepo {
  final ChangePasswordRemoteDataSource dataSource;

  PasswordRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        await dataSource.changePassword(request: request);
      },
    );
  }
}
