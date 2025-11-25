class AttendanceStatsResponse {
  final int totalDays;
  final int presentDays;
  final int absentDays;
  final int lateDays;
  final double totalWorkHours;
  final double averageHours;

  AttendanceStatsResponse({
    required this.totalDays,
    required this.presentDays,
    required this.absentDays,
    required this.lateDays,
    required this.totalWorkHours,
    required this.averageHours,
  });

  factory AttendanceStatsResponse.fromJson(Map<String, dynamic> json) =>
      AttendanceStatsResponse(
        totalDays: json['total_days'],
        presentDays: json['present_days'],
        absentDays: json['absent_days'],
        lateDays: json['late_days'],
        totalWorkHours: json['total_work_hours'],
        averageHours: json['average_hours'],
      );
}

