import 'package:core/constants/api_constants.dart';
import 'package:core/network/dio_clint.dart';
import 'package:data/requests/leaves_request.dart';

class LeavesRemoteDataSource {
  Future<dynamic> createLeave({required LeavesRequest request}) async {
    final response = await DioHelper.postData(
      url: ApiConstants.employeeLeavesEndpoint,
      data: {
        "type": request.type,
        "start_date": request.startDate,
        "end_date": request.endDate,
        "reason": request.reason,
      },
    );
    return response;
  }

  Future<dynamic> getLeaves({required int page}) async {
    final response = await DioHelper.getData(
      url: ApiConstants.employeeLeavesEndpoint,
      query: {"page": page, "page_size": 20},
    );
    return response;
  }

  Future<dynamic> getLeaveBalance() async {
    final response = await DioHelper.getData(
      url: ApiConstants.employeeLeavesBalanceEndpoint,
    );
    return response;
  }

  Future<dynamic> getLeaveByID({required String id}) async {
    final response = await DioHelper.getData(
      url: '${ApiConstants.employeeLeavesEndpoint}$id',
    );
    return response;
  }
}
