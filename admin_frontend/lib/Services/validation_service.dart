class ValidationService {
  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password can not be empty";
    } else if (value.length < 4) {
      return "Password must be atleast 6 characters long";
    } else {
      return null;
    }
  }

  static String? validateNonEmptiness(String? value) {
    if (value!.isEmpty) return "This field cannot be empty";
    return null;
  }

  // MOBILE NUMBER VALIDATOR
  static String? validateMobileNumber(String? mobilenumber) {
    var phoneNumberPattern = RegExp(r'9[87][0-9]{8}');
    if (mobilenumber!.isEmpty) {
      return "Please provide your mobile number";
    } else if (!phoneNumberPattern.hasMatch(mobilenumber)) {
      return "Invalid mobile number !";
    } else {
      return null;
    }
  }

  // OTP VALIDATOR
  static String? validateOTP(String? value) {
    if (value!.isEmpty) {
      return "Enter your OTP";
    } else {
      return null;
    }
  }

  //Email validator
  static String? validateEmail(String? email) {
    var emailPattern = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})$');
    if (email!.isEmpty) {
      return "Enter your email";
    } else if (!emailPattern.hasMatch(email)) {
      return "Invalid email address !";
    } else {
      return null;
    }
  }
}
