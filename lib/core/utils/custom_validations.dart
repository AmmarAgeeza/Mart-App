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
    // Check the length of the password
    RegExp passwordRegex =
        RegExp(r"^(?=.*\d)(?=.*[@$!%*#?&])(?=.*[a-z])(?=.*[A-Z]).{8,}$");

    // Check if the password contains at least one uppercase letter
    /* if (!password.contains(RegExp(r'[A-Z]'))) {
    return false;
  }

  // Check if the password contains at least one lowercase letter
  if (!password.contains(RegExp(r'[a-z]'))) {
    return false;
  }

  // Check if the password contains at least one digit
  if (!password.contains(RegExp(r'[0-9]'))) {
    return false;
  }

  // Check if the password contains at least one special character
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return false;
  }*/

    // All criteria passed, so the password is valid
    // return true;

    return passwordRegex.hasMatch(password);
  }
}
