import 'dart:math';

import '../entitites/password_status.dart';
import '../entitites/password_strength.dart';

class CheckPasswordStatus {
  PasswordStatus call(String password) {
    var status = PasswordStatus(
      strength: _getPasswordStrength(password),
    );

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

  PasswordStrength _getPasswordStrength(String password) {
    final strength = _estimateBruteforceStrength(password);
    
    if (strength >= 0 && strength <= 0.25) {
      return PasswordStrength.veryWeak;
    }
    if (strength >= 0.26 && strength <= 0.5) {
      return PasswordStrength.weak;
    }
    if (strength >= 0.51 && strength <= 0.75) {
      return PasswordStrength.strong;
    }
    if (strength >= 0.76 && strength <= 1) {
      return PasswordStrength.veryStrong;
    }
    return PasswordStrength.veryWeak;
  }

  double _estimateBruteforceStrength(String password) {
    if (password.isEmpty) return 0;

    double charsetBonus;
    if (RegExp(r'^[a-z]*$').hasMatch(password)) {
      charsetBonus = 1.0;
    } else if (RegExp(r'^[a-z0-9]*$').hasMatch(password)) {
      charsetBonus = 1.2;
    } else if (RegExp(r'^[a-zA-Z]*$').hasMatch(password)) {
      charsetBonus = 1.3;
    } else if (RegExp(r'^[a-z\-_!?]*$').hasMatch(password)) {
      charsetBonus = 1.3;
    } else if (RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password)) {
      charsetBonus = 1.5;
    } else {
      charsetBonus = 1.8;
    }

    return _getCurve(password.length * charsetBonus);
  }

  double _getCurve(double x) {
    return _getLogisticFunction((x / 3.0) - 4.0);
  }

  double _getLogisticFunction(double x) {
    return 1.0 / (1.0 + exp(-x));
  }
}
