import 'package:data/responses/leave_balance/leave_balance_response.dart';
import 'package:data/responses/leaves/leaves_data_response.dart';

enum BalanceStatus {
  init,
  getBalanceError,
  getBalanceLoading,
  getBalanceSuccess,
}

enum LeavesStatus { init, getLeavesSuccess, getLeavesLoading, getLeavesError }

enum LeavesDetailsStatus {
  init,
  getLeavesByIDSuccess,
  getLeavesByIDLoading,
  getLeavesByIDError,
}

enum CreateLeavesStatus {
  init,
  selectedType,
  selectStartDate,
  selectEndDate,
  createLeaveLoading,
  createLeaveError,
  createLeaveSuccess,
}

class LeavesStats {
  final String errorMessage;
  final CreateLeavesStatus status;
  final LeavesStatus leavesStatus;
  final BalanceStatus balanceStatus;
  final LeavesDetailsStatus detailsStatus;
  final String? typeValue;
  final DateTime? startDate;
  final DateTime? endDate;
  final int difference;
  final List<LeavesDataResponse> leavesData;
  final LeaveBalanceResponse? balanceResponse;
  final LeavesDataResponse? leaveByID;

  LeavesStats({
    this.errorMessage = '',
    this.status = CreateLeavesStatus.init,
    this.typeValue,
    this.startDate,
    this.endDate,
    this.difference = 0,
    this.leavesData = const [],
    this.balanceResponse,
    this.balanceStatus = BalanceStatus.init,
    this.leavesStatus = LeavesStatus.init,
    this.detailsStatus = LeavesDetailsStatus.init,
    this.leaveByID,
  });

  bool get isCreateLoading => status == CreateLeavesStatus.createLeaveLoading;

  bool get isCreateError => status == CreateLeavesStatus.createLeaveError;

  bool get isCreateSuccess => status == CreateLeavesStatus.createLeaveSuccess;

  bool get isGetLeavesSuccess => leavesStatus == LeavesStatus.getLeavesSuccess;

  bool get isGetLeavesLoading => leavesStatus == LeavesStatus.getLeavesLoading;

  bool get isGetLeavesError => leavesStatus == LeavesStatus.getLeavesError;

  bool get isGetLeavesByIDError =>
      detailsStatus == LeavesDetailsStatus.getLeavesByIDError;

  bool get isGetLeavesByIDLoading =>
      detailsStatus == LeavesDetailsStatus.getLeavesByIDLoading;

  bool get isGetLeavesByIDSuccess =>
      detailsStatus == LeavesDetailsStatus.getLeavesByIDSuccess;

  bool get isGetBalanceSuccess =>
      balanceStatus == BalanceStatus.getBalanceSuccess;

  bool get isGetBalanceLoading =>
      balanceStatus == BalanceStatus.getBalanceLoading;

  bool get isGetBalanceError => balanceStatus == BalanceStatus.getBalanceError;

  LeavesStats copyWith({
    final String? errorMessage,
    final CreateLeavesStatus? status,
    final BalanceStatus? balanceStatus,
    final String? typeValue,
    final DateTime? startDate,
    final DateTime? endDate,
    final int? difference,
    final List<LeavesDataResponse>? leavesData,
    final LeaveBalanceResponse? balanceResponse,
    final LeavesStatus? leavesStatus,
    final LeavesDetailsStatus? detailsStatus,
    final LeavesDataResponse? leaveByID
  }) => LeavesStats(
    errorMessage: errorMessage ?? this.errorMessage,
    status: status ?? this.status,
    typeValue: typeValue ?? this.typeValue,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    difference: difference ?? this.difference,
    leavesData: leavesData ?? this.leavesData,
    balanceResponse: balanceResponse ?? this.balanceResponse,
    balanceStatus: balanceStatus ?? this.balanceStatus,
    leavesStatus: leavesStatus ?? this.leavesStatus,
    detailsStatus: detailsStatus ?? this.detailsStatus,
    leaveByID: leaveByID ?? this.leaveByID
  );
}
