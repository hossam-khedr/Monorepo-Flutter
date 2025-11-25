import 'package:core/error/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:data/requests/location_request.dart';
import 'package:data/responses/attendance/attendance_stats_response.dart';

import '../../responses/attendance/attendance_data.dart';

abstract class AttendanceRepo{
  Future<Either<Failure,AttendanceData>>checkIn({required LocationRequest request});
  Future<Either<Failure,AttendanceData>>checkOut({required LocationRequest request});
  Future<Either<Failure,AttendanceData>>getTodayAttendance();
  Future<Either<Failure,AttendanceStatsResponse>>getAttendanceStats();
}