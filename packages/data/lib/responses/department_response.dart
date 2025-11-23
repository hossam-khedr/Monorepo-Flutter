class DepartmentResponse {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String nameArabic;
  final String description;
  final String? managerId;

  DepartmentResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.nameArabic,
    required this.description,
    required this.managerId,
  });

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) {
    return DepartmentResponse(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      nameArabic: json['name_arabic'],
      description: json['description'],
      managerId: json['manager_id'],
    );
  }
}
