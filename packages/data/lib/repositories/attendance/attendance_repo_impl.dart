import 'package:core/error/faliure.dart';
import 'package:core/utils/api_call_helper.dart';

import 'package:dartz/dartz.dart';
import 'package:data/data_soures/remote/attendance_remote_data_source.dart';

import 'package:data/requests/location_request.dart';
import 'package:data/responses/attendance/attendance_data.dart';
import 'package:data/responses/attendance/attendance_stats_response.dart';


import 'attendance_repo.dart';

class AttendanceRepoImpl implements AttendanceRepo {
  final AttendanceRemoteDataSource remoteDataSource;
  AttendanceRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, AttendanceData>> checkIn({
    required LocationRequest request,
  })async {
    return ApiCallHelper().safeApiCall(callback: ()async{
    final response =   await remoteDataSource.checkIn(request: request);
    final data = AttendanceData.fromJson(response.data['data']);
    return data;

    });
  }

  @override
  Future<Either<Failure, AttendanceData>> checkOut({
    required LocationRequest request,
  })async {
    return ApiCallHelper().safeApiCall(callback: ()async{
    final response =   await remoteDataSource.checkOut(request: request);

    final data = AttendanceData.fromJson(response.data['data']);
    return data;
    });
  }

  @override
  Future<Either<Failure, AttendanceData>> getTodayAttendance()async {
    return ApiCallHelper().safeApiCall(callback: ()async{
      final response = await remoteDataSource.getTodayAttendance();
      final data = AttendanceData.fromJson(response.data['data']);
      return data;
    });
  }

  @override
  Future<Either<Failure, AttendanceStatsResponse>> getAttendanceStats()async {
   return ApiCallHelper().safeApiCall(callback: ()async{
     final response = await remoteDataSource.getAttendanceStats();
     final data = AttendanceStatsResponse.fromJson(response.data['data']);
     return data;
   });
  }
}
