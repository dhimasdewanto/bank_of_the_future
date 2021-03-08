import '../entitites/password_status.dart';

class CheckPasswordStatus {
  PasswordStatus call(String password) {
    var status = PasswordStatus();
    if (password.contains(RegExp('[A-Z]'))) {
      status = status.copyWith(
        hasUpperCase: true,
      );
    }
    if (password.contains(RegExp('[a-z]'))) {
      status = status.copyWith(
        hasLowerCase: true,
      );
    }
    if (password.contains(RegExp('[0-9]'))) {
      status = status.copyWith(
        hasNumber: true,
      );
    }
    if (password.length >= 9) {
      status = status.copyWith(
        hasTotal: true,
      );
    }
    return status;
  }
}
