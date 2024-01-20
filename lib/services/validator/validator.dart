class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    // Check if the name contains numbers or special characters
    RegExp nameRegExp =
        RegExp(r'^[a-zA-Z ]+$'); // Only allow letters and spaces
    if (!nameRegExp.hasMatch(name)) {
      return 'Name must contain only letters and spaces';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  static String? validatePhoneNumber({required String? phoneNumber}) {
    if (phoneNumber == null) {
      return null;
    }

    RegExp phoneNumberRegExp = RegExp(r"^[0-9]{10}$");

    if (phoneNumber.isEmpty) {
      return 'Phone number can\'t be empty';
    } else if (!phoneNumberRegExp.hasMatch(phoneNumber)) {
      return 'Enter a valid phone number with 10 digits';
    }

    return null;
  }
}
