class Attendance {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String userId;
  final DateTime? date;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final String status;
  final double workHours;
  final double overtimeHours;
  final int lateMinutes;
  final int earlyLeave;
  final String notes;
  final String checkInLocation;
  final String checkOutLocation;

  Attendance({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.userId,
    this.date,
    this.checkIn,
    this.checkOut,
    required this.status,
    required this.workHours,
    required this.overtimeHours,
    required this.lateMinutes,
    required this.earlyLeave,
    required this.notes,
    required this.checkInLocation,
    required this.checkOutLocation,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'] as String? ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      userId: json['user_id'] as String? ?? '',
      date: json['date'] != null
          ? DateTime.tryParse(json['date'])
          : null,
      checkIn: json['check_in'] != null
          ? DateTime.tryParse(json['check_in'])
          : null,
      checkOut: json['check_out'] != null
          ? DateTime.tryParse(json['check_out'])
          : null,
      status: json['status'] as String? ?? '',
      workHours: (json['work_hours'] as num?)?.toDouble() ?? 0.0,
      overtimeHours: (json['overtime_hours'] as num?)?.toDouble() ?? 0.0,
      lateMinutes: json['late_minutes'] as int? ?? 0,
      earlyLeave: json['early_leave'] as int? ?? 0,
      notes: json['notes'] as String? ?? '',
      checkInLocation: json['check_in_location'] as String? ?? '',
      checkOutLocation: json['check_out_location'] as String? ?? '',
    );
  }
}