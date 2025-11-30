import 'package:data/requests/leaves_request.dart';
import 'package:employee/leaves/logic/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data/repositories/leaves/leaves_repo.dart';

class LeavesCubit extends Cubit<LeavesStats> {
  final LeavesRepo repo;

  LeavesCubit({required this.repo}) : super(LeavesStats());

  void selectedType(String? value) {
    emit(
      state.copyWith(status: CreateLeavesStatus.selectedType, typeValue: value),
    );
  }

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? pickd = await showDatePicker(
      context: context,
      initialDate: state.startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickd != null && pickd != state.startDate) {
      int difference = 0;
      if (state.endDate != null) {
        difference = pickd.difference(state.endDate!).inDays + 1;
      }
      emit(
        state.copyWith(
          status: CreateLeavesStatus.selectStartDate,
          startDate: pickd,
          difference: difference,
        ),
      );
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? pickd = await showDatePicker(
      context: context,
      initialDate: state.endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickd != null && pickd != state.endDate) {
      int difference = 0;
      if (state.startDate != null) {
        difference = pickd.difference(state.startDate!).inDays + 1;
      }
      emit(
        state.copyWith(
          status: CreateLeavesStatus.selectStartDate,
          endDate: pickd,
          difference: difference,
        ),
      );
    }
  }

  Future<void> createLeave({required LeavesRequest request}) async {
    emit(state.copyWith(status: CreateLeavesStatus.createLeaveLoading));
    (await repo.createLeave(request: request)).fold(
      (failure) => emit(
        state.copyWith(
          status: CreateLeavesStatus.createLeaveError,
          errorMessage: failure.message,
        ),
      ),
      (success) =>
          emit(state.copyWith(status: CreateLeavesStatus.createLeaveSuccess)),
    );
  }

  Future<void> getLeaves({required int page}) async {
    emit(state.copyWith(leavesStatus: LeavesStatus.getLeavesLoading));
    (await repo.getLeaves(page: page)).fold(
      (failure) => emit(
        state.copyWith(
          leavesStatus: LeavesStatus.getLeavesError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          leavesStatus: LeavesStatus.getLeavesSuccess,
          leavesData: data,
        ),
      ),
    );
  }

  Future<void> getLeavesById({required String id}) async {
    emit(
      state.copyWith(detailsStatus: LeavesDetailsStatus.getLeavesByIDLoading),
    );
    (await repo.getLeavesByID(id: id)).fold(
      (failure) => emit(
        state.copyWith(
          detailsStatus: LeavesDetailsStatus.getLeavesByIDError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          detailsStatus: LeavesDetailsStatus.getLeavesByIDSuccess,
          leaveByID: data,
        ),
      ),
    );
  }

  Future<void> getLeaveBalance() async {
    emit(state.copyWith(balanceStatus: BalanceStatus.getBalanceLoading));
    (await repo.getLeavesBalance()).fold(
      (failure) => emit(
        state.copyWith(
          balanceStatus: BalanceStatus.getBalanceError,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          balanceStatus: BalanceStatus.getBalanceSuccess,
          balanceResponse: data,
        ),
      ),
    );
  }

  void getLeavesData() {
    getLeaveBalance();
    getLeaves(page: 1);
  }
}
