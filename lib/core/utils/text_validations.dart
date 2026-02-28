class TextValidation {
  // Validate a form input email
  static bool isEmailValid(String? value) {
    if (value == null) return false;
    // Trim to remove leading/trailing spaces
    final trimmed = value.trim();
    // Reject if trimmed version doesn't match original (i.e., there were spaces)
    if (trimmed != value) return false;
    final bool valid = RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$").hasMatch(trimmed);

    return valid;
  }

  // Validate a form input password
  static bool isPasswordValid(String? value) {
    if (value == null) return false;
    // Password must be at least 6 characters long
    final bool valid = RegExp(r'^.{6,}$').hasMatch(value.trim());
    return valid;
  }

  // Validate a form input name
  static bool isNameValid(String? value) {
    if (value == null) return false;
    // Name must not be empty and contain only alphabetic characters and spaces
    final bool valid =
        RegExp(r'^[a-zA-Z\s]+$').hasMatch(value) && value.trim().isNotEmpty;
    return valid;
  }

  // Validate a phone number
  static bool isValidPhoneNumber(String? value) {
    if (value == null) return false;
    final RegExp phoneRegex = RegExp(
      r'^(?:(?:(?:\+?234(?:\h1)?|01)\h*)?(?:\(\d{3}\)|\d{3})|\d{4})(?:\W*\d{3})?\W*\d{4}(?!\d)',
    );
    return phoneRegex.hasMatch(value);
  }

  static bool isValidLink(String? value) {
    if (value == null) return false;
    final bool valid =
        RegExp(
          r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?',
        ).hasMatch(value) &&
        value.trim().isNotEmpty;
    return valid;
  }
}
