class Validators {
  static String? validateMobileNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final trimmed = value.trim();
    if (!RegExp(r'^[0-9]+$').hasMatch(trimmed)) {
      return 'Phone number must contain only digits';
    }
    if (trimmed.length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final trimmed = value.trim();
    // More robust email regex
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(trimmed)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    final trimmed = value.trim();
    if (trimmed.length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmed)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (value.length != 4) {
      return 'OTP must be 4 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'OTP must contain only digits';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Age is required';
    }
    final age = int.tryParse(value.trim());
    if (age == null) {
      return 'Please enter a valid age';
    }
    if (age < 1 || age > 120) {
      return 'Please enter a valid age (1-120)';
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    return null;
  }

  /// Validates interest rate (%). Required, non-negative number, max 100.
  static String? validateInterestRate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Interest rate is required';
    }
    final rate = num.tryParse(value.trim());
    if (rate == null) {
      return 'Please enter a valid number';
    }
    if (rate < 0) {
      return 'Interest rate cannot be negative';
    }
    if (rate > 100) {
      return 'Interest rate cannot exceed 100%';
    }
    return null;
  }

  /// Validates repayment period in months. Required, positive integer (e.g. 1–120).
  static String? validateRepaymentPeriod(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Repayment period is required';
    }
    final period = int.tryParse(value.trim());
    if (period == null) {
      return 'Please enter a valid number of months';
    }
    if (period < 1) {
      return 'Repayment period must be at least 1 month';
    }
    if (period > 120) {
      return 'Repayment period cannot exceed 120 months';
    }
    return null;
  }

  /// Validates rejection reason. Required.
  static String? validateRejectionReason(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Rejection reason is required';
    }
    return null;
  }
}
