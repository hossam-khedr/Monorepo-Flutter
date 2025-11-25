import 'package:data/responses/attendance/attendance_data.dart';
import 'package:data/responses/attendance/attendance_stats_response.dart';

enum AttendanceStatus {
  init,
  checkInCheckoutLoading,
  checkInCheckoutError,
  checkInCheckoutSuccess,
  getTodayAttendanceLoading,
  getTodayAttendanceError,
  getTodayAttendanceSuccess,
  getAttendanceStatsLoading,
  getAttendanceStatsError,
  getAttendanceStatsSuccess,
  gettingLocation,
  gettingLocationError,
}

class AttendanceStats {
  final String errorMessage;
  final AttendanceStatus status;
  final AttendanceData? data;
  final AttendanceStatsResponse? statsResponse;

  AttendanceStats({
    this.errorMessage = '',
    this.status = AttendanceStatus.init,
    this.data,
    this.statsResponse,
  });

  bool get isGettingLocation => status == AttendanceStatus.gettingLocation;

  bool get isGettingLocationError =>
      status == AttendanceStatus.gettingLocationError;

  bool get isAttendanceStatsLoading =>
      status == AttendanceStatus.getAttendanceStatsLoading;

  bool get isAttendanceStatsError =>
      status == AttendanceStatus.getAttendanceStatsError;

  bool get isAttendanceStatsSuccess =>
      status == AttendanceStatus.getAttendanceStatsSuccess;

  bool get isGetTodayAttendanceLoading =>
      status == AttendanceStatus.getTodayAttendanceLoading;

  bool get isGetTodayAttendanceError =>
      status == AttendanceStatus.getTodayAttendanceError;

  bool get isGetTodayAttendanceSuccess =>
      status == AttendanceStatus.getTodayAttendanceSuccess;

  bool get isCheckInCheckOutLoading =>
      status == AttendanceStatus.checkInCheckoutLoading;

  bool get isCheckInCheckOutError =>
      status == AttendanceStatus.checkInCheckoutError;

  bool get isCheckInCheckOutSuccess =>
      status == AttendanceStatus.checkInCheckoutSuccess;

  AttendanceStats copWith({
    final String? errorMessage,
    final AttendanceStatus? status,
    final AttendanceData? data,
    final AttendanceStatsResponse? statsResponse,
  }) => AttendanceStats(
    errorMessage: errorMessage ?? this.errorMessage,
    status: status ?? this.status,
    data: data ?? this.data,
    statsResponse: statsResponse ?? this.statsResponse,
  );
}
