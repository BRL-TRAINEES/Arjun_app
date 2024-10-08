String checkPasswordStrength(String password) {
  if (password.isEmpty) return "";

  final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  final hasLowercase = password.contains(RegExp(r'[a-z]'));
  final hasDigits = password.contains(RegExp(r'[0-9]'));
  final hasSpecialCharacters =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  if (hasUppercase && hasLowercase && hasDigits && hasSpecialCharacters) {
    return "Strong password";
  } else {
    return "Weak password";
  }
}
