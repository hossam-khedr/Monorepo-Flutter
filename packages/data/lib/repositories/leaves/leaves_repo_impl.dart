import 'package:core/error/faliure.dart';
import 'package:core/utils/api_call_helper.dart';

import 'package:dartz/dartz.dart';
import 'package:data/data_soures/remote/leaves_remote_data_source.dart';

import 'package:data/requests/leaves_request.dart';
import 'package:data/responses/leave_balance/leave_balance_response.dart';
import 'package:data/responses/leaves/leaves_data_response.dart';

import 'leaves_repo.dart';

class LeavesRepoImpl implements LeavesRepo {
  final LeavesRemoteDataSource dataSource;

  LeavesRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> createLeave({
    required LeavesRequest request,
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async => dataSource.createLeave(request: request),
    );
  }

  @override
  Future<Either<Failure, List<LeavesDataResponse>>> getLeaves({
    required int page,
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await dataSource.getLeaves(page: page);
        final data = response.data['data'] as List;
        final result = data.map((e) => LeavesDataResponse.fromJson(e)).toList();
        return result;
      },
    );
  }

  @override
  Future<Either<Failure, LeaveBalanceResponse>> getLeavesBalance() async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await dataSource.getLeaveBalance();
        final data = LeaveBalanceResponse.fromJson(
          response.data['data']['balance'],
        );
        return data;
      },
    );
  }

  @override
  Future<Either<Failure, LeavesDataResponse>> getLeavesByID({
    required String id,
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await dataSource.getLeaveByID(id: id);

        final data = LeavesDataResponse.fromJson(response.data['data']);


        return data;
      },
    );
  }
}
