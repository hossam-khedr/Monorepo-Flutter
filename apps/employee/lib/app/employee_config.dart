class EmployeeConfig{
  static const List<String> allowedRoles = ['employee'];

  static bool isRoleAllowed(String userRole) {
    return allowedRoles.contains(userRole.toLowerCase());
  }
}