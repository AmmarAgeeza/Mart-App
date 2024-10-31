class CustomValidationHandler {
  // phone number
  static bool isValidPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check if the phone number consists of all numbers and has a length of 11 digits
    if (digitsOnly.length == 11 && int.tryParse(digitsOnly) != null) {
      return true;
    } else {
      return false;
    }
  }

//name
  static bool isValidName(String name) {
    // Regular expression pattern for validating the name
    final RegExp nameRegex = RegExp(r"^[A-Za-z]+(?:[-' ][A-Za-z]+)*$");

    // Check if the name matches the pattern
    if (nameRegex.hasMatch(name)) {
      return true;
    } else {
      return false;
    }
  }

//email
  static bool isValidEmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

//password
  static bool isValidPassword(String password) {
    // Check
    // 1. the length of the password
    // 2. contains at least one uppercase letter
    // 3. contains at least one lowercase letter
    // 4. contains at least one digit
    // 5. contains at least one special character
    // All criteria passed, so the password is valid
    // return true;
    RegExp passwordRegex =
        RegExp(r"^(?=.*\d)(?=.*[@$!%*#?&])(?=.*[a-z])(?=.*[A-Z]).{8,}$");
    return passwordRegex.hasMatch(password);
  }

  // Check if the password contains at least one uppercase letter
  static bool passwordHasUppercase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  // Check if the password contains at least one lowercase letter
  static bool passwordHasLowercase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  // Check if the password contains at least one digit
  static bool passwordHasDigit(String password) {
    return RegExp(r'[0-9]').hasMatch(password);
  }

  // Check if the password contains at least one special character
  static bool passwordHasSpecialCharacter(String password) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  // Check if the password contains at least 8 characters
  static bool passwordHasMinLength(String password) {
    return password.length >= 8;
  }
}
