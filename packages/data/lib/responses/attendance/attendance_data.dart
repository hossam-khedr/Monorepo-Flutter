import 'attendance.dart';

class AttendanceData {
  final Attendance? attendance;
  final bool hasCheckedIn;
  final bool hasCheckedOut;

  AttendanceData({
    this.attendance,
    required this.hasCheckedIn,
    required this.hasCheckedOut,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      attendance: json['attendance'] != null
          ? Attendance.fromJson(json['attendance'])
          : null,
      hasCheckedIn: json['has_checked_in'] as bool? ?? false,
      hasCheckedOut: json['has_checked_out'] as bool? ?? false,
    );
  }
}