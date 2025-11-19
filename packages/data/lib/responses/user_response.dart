class UserResponse {
  final String id;
  final String email;
  final String role;
  final String firstName;
  final String lastName;
  final String fullPosition;
  final String phoneNumber;
  final String position;
  final String profileImage;
  final bool isActive;
  final String hireDate;

  UserResponse({
    required this.id,
    required this.email,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.fullPosition,
    required this.position,
    required this.phoneNumber,
    required this.profileImage,
    required this.isActive,
    required this.hireDate,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    id: json['id'],
    email: json['email'],
    role: json['role'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    fullPosition: json['full_name_arabic'],
    position: json['position'],
    phoneNumber: json['phone_number'],
    profileImage: json['profile_image'],
    isActive: json['is_active'],
    hireDate: json['hire_date'],
  );
}
