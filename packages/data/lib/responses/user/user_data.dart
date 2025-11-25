import 'package:data/responses/department/department_response.dart';
import 'package:data/responses/leave/leave_balance_response.dart';

class UserData {
  final String id;
  final String email;
  final String role;
  final bool isActive;
  final String createdAt;
  final String firstName;
  final String lastName;
  final String fullNameArabic;
  final String nationalId;
  final String dateOfBirth;
  final String gender;
  final String phoneNumber;
  final String address;
  final String profileImage;
  final String employeeCode;
  final String departmentId;
  final DepartmentResponse department;
  final String position;
  final String hireDate;
  final String? managerId;
  final int baseSalary;
  final int totalSalary;
  final int annualLeaveBalance;
  final int sickLeaveBalance;
  final int casualLeaveBalance;
  final LeaveBalanceResponse leaveBalance;

  UserData({
    required this.id,
    required this.email,
    required this.role,
    required this.isActive,
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.fullNameArabic,
    required this.nationalId,
    required this.dateOfBirth,
    required this.gender,
    required this.phoneNumber,
    required this.address,
    required this.profileImage,
    required this.employeeCode,
    required this.departmentId,
    required this.department,
    required this.position,
    required this.hireDate,
    required this.managerId,
    required this.baseSalary,
    required this.totalSalary,
    required this.annualLeaveBalance,
    required this.sickLeaveBalance,
    required this.casualLeaveBalance,
    required this.leaveBalance,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      email: json['email'],
      role: json['role'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      fullNameArabic: json['full_name_arabic'],
      nationalId: json['national_id'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      profileImage: json['profile_image'],
      employeeCode: json['employee_code'],
      departmentId: json['department_id'],
      department: DepartmentResponse.fromJson(json['department']),
      position: json['position'],
      hireDate: json['hire_date'],
      managerId: json['manager_id'],
      baseSalary: json['base_salary'],
      totalSalary: json['total_salary'],
      annualLeaveBalance: json['annual_leave_balance'],
      sickLeaveBalance: json['sick_leave_balance'],
      casualLeaveBalance: json['casual_leave_balance'],
      leaveBalance: LeaveBalanceResponse.fromJson(json['leave_balance']),
    );
  }
}
