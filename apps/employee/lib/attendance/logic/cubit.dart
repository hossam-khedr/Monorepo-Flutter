import 'package:core/utils/servises/location_service.dart';
import 'package:data/repositories/attendance/attendance_repo.dart';
import 'package:data/requests/location_request.dart';
import 'package:employee/attendance/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AttendanceCubit extends Cubit<AttendanceStats> {
  final AttendanceRepo repo;

  AttendanceCubit({required this.repo}) : super(AttendanceStats());

  final LocationService _locationService = LocationService();

  Future<void> checkIn({required BuildContext context}) async {
    final postion = await _getLocation(context: context);
    emit(state.copWith(status: AttendanceStatus.checkInCheckoutLoading));
    (await repo.checkIn(
      request: LocationRequest(
        latLong:
            '${postion?.latitude.toString()},${postion?.longitude.toString()}',
        notes: 'تسجيل حضور',
      ),
    )).fold(
      (failure) => emit(
        state.copWith(
          status: AttendanceStatus.checkInCheckoutError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copWith(
          status: AttendanceStatus.checkInCheckoutSuccess,
          data: data,
        ),
      ),
    );
  }

  Future<void> checkOut({required BuildContext context}) async {
    final postion = await _getLocation(context: context);
    emit(state.copWith(status: AttendanceStatus.checkInCheckoutLoading));
    (await repo.checkOut(
      request: LocationRequest(
        latLong:
            '${postion?.latitude.toString()},${postion?.longitude.toString()}',
        notes: 'تسجيل انصراف',
      ),
    )).fold(
      (failure) => emit(
        state.copWith(
          status: AttendanceStatus.checkInCheckoutError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copWith(
          status: AttendanceStatus.checkInCheckoutSuccess,
          data: data,
        ),
      ),
    );
  }

  Future<void> getTodayAttendance() async {
    emit(state.copWith(status: AttendanceStatus.getTodayAttendanceLoading));
    (await repo.getTodayAttendance()).fold(
      (failure) => emit(
        state.copWith(
          status: AttendanceStatus.getTodayAttendanceError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copWith(
          status: AttendanceStatus.getTodayAttendanceSuccess,
          data: data,
        ),
      ),
    );
  }

  Future<void> getAttendanceStats() async {
    emit(state.copWith(status: AttendanceStatus.getAttendanceStatsLoading));
    (await repo.getAttendanceStats()).fold(
      (failure) => emit(
        state.copWith(
          status: AttendanceStatus.getAttendanceStatsError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copWith(
          status: AttendanceStatus.getAttendanceStatsSuccess,
          statsResponse: data,
        ),
      ),
    );
  }

  Future<Position?> _getLocation({required BuildContext context}) async {
    return await _locationService.getCurrentPosition(context);
  }
}
