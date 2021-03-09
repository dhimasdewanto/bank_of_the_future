import 'password_strength.dart';

class PasswordStatus {
  PasswordStatus({
    this.hasLowerCase = false,
    this.hasNumber = false,
    this.hasTotal = false,
    this.hasUpperCase = false,
    this.strength = PasswordStrength.veryWeak,
  });

  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasTotal;
  final bool hasUpperCase;
  final PasswordStrength strength;

  @override
  int get hashCode {
    return hasLowerCase.hashCode ^
        hasNumber.hashCode ^
        hasTotal.hashCode ^
        hasUpperCase.hashCode ^
        strength.hashCode;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PasswordStatus &&
        o.hasLowerCase == hasLowerCase &&
        o.hasNumber == hasNumber &&
        o.hasTotal == hasTotal &&
        o.hasUpperCase == hasUpperCase &&
        o.strength == strength;
  }

  PasswordStatus copyWith({
    bool? hasLowerCase,
    bool? hasNumber,
    bool? hasTotal,
    bool? hasUpperCase,
    PasswordStrength? strength,
  }) {
    return PasswordStatus(
      hasLowerCase: hasLowerCase ?? this.hasLowerCase,
      hasNumber: hasNumber ?? this.hasNumber,
      hasTotal: hasTotal ?? this.hasTotal,
      hasUpperCase: hasUpperCase ?? this.hasUpperCase,
      strength: strength ?? this.strength,
    );
  }
}
