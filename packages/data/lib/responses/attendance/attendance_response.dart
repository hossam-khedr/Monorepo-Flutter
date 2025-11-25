import 'attendance_data.dart';

class AttendanceResponse {
  final bool success;
  final String message;
  final AttendanceData? data;

  AttendanceResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) {
    return AttendanceResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? AttendanceData.fromJson(json['data'])
          : null,
    );
  }
}