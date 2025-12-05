class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }


    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }

    if (value.length > 100) {
      return 'البريد الإلكتروني طويل جداً (الحد الأقصى 100 حرف)';
    }

    return null;
  }


  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password required';
    }

    if (value.length < 8) {
      return 'The password must be at least 8 characters long.';
    }

    if (value.length > 50) {
      return 'The password is too long (maximum 50 characters)';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'The password must contain at least one capital letter.';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'The password must contain at least one lowercase letter.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'The password must contain at least one number.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'The password must contain at least one special character.';
    }

    return null;
  }

  static String? fieldRequerd(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذه الحقل مطلوب';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }

    final trimmedValue = value.trim();

    if (trimmedValue.length < 2) {
      return 'الاسم يجب أن يكون حرفين على الأقل';
    }

    if (trimmedValue.length > 50) {
      return 'الاسم طويل جداً (الحد الأقصى 50 حرف)';
    }

    final nameRegex = RegExp(r'^[\u0600-\u06FFa-zA-Z\s\-]+$');
    if (!nameRegex.hasMatch(trimmedValue)) {
      return 'الاسم يجب أن يحتوي على أحرف فقط';
    }

    return null;
  }

  static String? validatePasswordConfirmation(String? password,
      String? confirmPassword,) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password required';
    }

    if (password != confirmPassword) {
      return 'The password does not match';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }

    final phoneRegex = RegExp(r'^[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'رقم الهاتف غير صحيح';
    }

    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }
    return null;
  }

  static String? validateMinLength(String? value,
      int minLength,
      String fieldName,) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }

    if (value.length < minLength) {
      return '$fieldName يجب أن يكون $minLength أحرف على الأقل';
    }

    return null;
  }

  static String? validateMaxLength(String? value,
      int maxLength,
      String fieldName,) {
    if (value != null && value.length > maxLength) {
      return '$fieldName طويل جداً (الحد الأقصى $maxLength حرف)';
    }

    return null;
  }


  static String? validateNachonalId(String? value) {
    if (value == null || value.isEmpty ) {
      return 'Field Is Required';
    }
    if(value.length < 14){
      return 'Id Must be 14 number';
    }
    return null;
  }

}



