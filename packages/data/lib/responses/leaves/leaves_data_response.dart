class LeavesDataResponse {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final String type;
  final String status;
  final String startDate;
  final String endDate;
  final int totalDays;
  final String reason;
  final String attachment;
  final String? reviewedById;
  final String? reviewedAt;
  final String reviewNotes;

  LeavesDataResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.type,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.reason,
    required this.attachment,
    required this.reviewedById,
    required this.reviewedAt,
    required this.reviewNotes,
  });


  factory LeavesDataResponse.fromJson(Map<String, dynamic> json) {
    return LeavesDataResponse(
      id: json['id'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      userId: json['user_id'] ?? '',
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      totalDays: json['total_days'] ?? 0,
      reason: json['reason'] ?? '',
      attachment: json['attachment'] ?? '',
      reviewedById: json['reviewed_by_id'],
      reviewedAt: json['reviewed_at'],
      reviewNotes: json['review_notes'] ?? '',
    );
  }
}
