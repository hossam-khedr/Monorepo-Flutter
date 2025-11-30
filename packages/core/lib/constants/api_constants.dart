abstract class ApiConstants {
  static const String baseURL = 'http://192.168.1.6:8080/api/v1/';
  static const String loginEndpoint = 'auth/login';
  static const String profileEndpoint = 'profile';
  static const String changePasswordEndpoint = 'auth/first-login-password';
  static const String refreshEndpoint = 'auth/refresh';

  // Employee
  static const String checkInEndpoint = 'employee/attendance/check-in';
  static const String checkOutEndpoint = 'employee/attendance/check-out';
  static const String getTodayAttendanceEndpoint = 'employee/attendance/today';
  static const String attendanceStatsEndpoint = 'employee/attendance/stats';
  static const String employeeLeavesEndpoint = 'employee/leaves/';
  static const String employeeLeavesBalanceEndpoint = 'employee/leaves/balance';




  static const String tokenKey = 'token';
}
