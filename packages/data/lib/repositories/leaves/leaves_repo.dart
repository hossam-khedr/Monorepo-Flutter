import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/requests/leaves_request.dart';
import 'package:data/responses/leave_balance/leave_balance_response.dart';
import 'package:data/responses/leaves/leaves_data_response.dart';

abstract class LeavesRepo{
  Future<Either<Failure,void>>createLeave({required LeavesRequest request});
  Future<Either<Failure,List<LeavesDataResponse>>>getLeaves({required int page});
  Future<Either<Failure,LeavesDataResponse>>getLeavesByID({required String id});
  Future<Either<Failure,LeaveBalanceResponse>>getLeavesBalance();

}