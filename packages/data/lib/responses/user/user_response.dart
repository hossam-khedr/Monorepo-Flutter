import 'package:data/responses/department/department_response.dart';
import 'package:data/responses/user/user_data.dart';

import '../leave_balance/leave_balance_response.dart';

class UserResponse {
  final UserData userData;
  final DepartmentResponse departmentResponse;
  final LeaveBalanceResponse leaveBalanceResponse;

  UserResponse({
    required this.userData,
    required this.departmentResponse,
    required this.leaveBalanceResponse,
  });
  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    userData: UserData.fromJson(json['data']),
    departmentResponse: DepartmentResponse.fromJson(json['data']['department']),
    leaveBalanceResponse: LeaveBalanceResponse.fromJson(
      json['data']['leave_balance'],
    ),
  );
}
