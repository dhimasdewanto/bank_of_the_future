class PasswordStatus {
  PasswordStatus({
    this.hasLowerCase = false,
    this.hasUpperCase = false,
    this.hasNumber = false,
    this.hasTotal = false,
  });

  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasTotal;
  final bool hasUpperCase;

  @override
  int get hashCode {
    return hasLowerCase.hashCode ^
        hasUpperCase.hashCode ^
        hasNumber.hashCode ^
        hasTotal.hashCode;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PasswordStatus &&
        o.hasLowerCase == hasLowerCase &&
        o.hasUpperCase == hasUpperCase &&
        o.hasNumber == hasNumber &&
        o.hasTotal == hasTotal;
  }

  PasswordStatus copyWith({
    bool? hasLowerCase,
    bool? hasUpperCase,
    bool? hasNumber,
    bool? hasTotal,
  }) {
    return PasswordStatus(
      hasLowerCase: hasLowerCase ?? this.hasLowerCase,
      hasUpperCase: hasUpperCase ?? this.hasUpperCase,
      hasNumber: hasNumber ?? this.hasNumber,
      hasTotal: hasTotal ?? this.hasTotal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hasLowerCase': hasLowerCase,
      'hasUpperCase': hasUpperCase,
      'hasNumber': hasNumber,
      'hasTotal': hasTotal,
    };
  }
}
