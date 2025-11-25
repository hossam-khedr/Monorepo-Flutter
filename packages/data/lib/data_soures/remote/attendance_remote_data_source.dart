import 'package:core/constants/api_constants.dart';
import 'package:core/network/dio_clint.dart';
import 'package:data/requests/location_request.dart';

class AttendanceRemoteDataSource {
  Future<dynamic> checkIn({required LocationRequest request}) async {
    final response = await DioHelper.postData(
      url: ApiConstants.checkInEndpoint,
      data: {"location": request.latLong, "notes": request.notes},
    );
    return response;
  }

  Future<dynamic> checkOut({required LocationRequest request}) async {
    final response = await DioHelper.postData(
      url: ApiConstants.checkOutEndpoint,
      data: {"location": request.latLong, "notes": request.notes},
    );
    return response;
  }

  Future<dynamic> getTodayAttendance() async {
    final response = await DioHelper.getData(
      url: ApiConstants.getTodayAttendanceEndpoint,
    );
    return response;
  }

  Future<dynamic> getAttendanceStats() async {
    final response = await DioHelper.getData(
      url: ApiConstants.attendanceStatsEndpoint,
    );
    return response;
  }
}
