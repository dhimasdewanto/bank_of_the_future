import 'package:flutter/foundation.dart';

class PersonalInformation {
  PersonalInformation({
    required this.listGoalActivation,
    this.goalActivation,
    required this.listMonthlyExpense,
    this.monthlyExpense,
    required this.listMonthlyIncome,
    this.monthlyIncome,
  });

  final String? goalActivation;
  final List<String> listGoalActivation;
  final List<String> listMonthlyExpense;
  final List<String> listMonthlyIncome;
  final String? monthlyExpense;
  final String? monthlyIncome;

  @override
  int get hashCode {
    return listGoalActivation.hashCode ^
        goalActivation.hashCode ^
        listMonthlyExpense.hashCode ^
        monthlyExpense.hashCode ^
        listMonthlyIncome.hashCode ^
        monthlyIncome.hashCode;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PersonalInformation &&
        listEquals(o.listGoalActivation, listGoalActivation) &&
        o.goalActivation == goalActivation &&
        listEquals(o.listMonthlyExpense, listMonthlyExpense) &&
        o.monthlyExpense == monthlyExpense &&
        listEquals(o.listMonthlyIncome, listMonthlyIncome) &&
        o.monthlyIncome == monthlyIncome;
  }

  PersonalInformation copyWith({
    List<String>? listGoalActivation,
    String? goalActivation,
    List<String>? listMonthlyExpense,
    String? monthlyExpense,
    List<String>? listMonthlyIncome,
    String? monthlyIncome,
  }) {
    return PersonalInformation(
      listGoalActivation: listGoalActivation ?? this.listGoalActivation,
      goalActivation: goalActivation ?? this.goalActivation,
      listMonthlyExpense: listMonthlyExpense ?? this.listMonthlyExpense,
      monthlyExpense: monthlyExpense ?? this.monthlyExpense,
      listMonthlyIncome: listMonthlyIncome ?? this.listMonthlyIncome,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listGoalActivation': listGoalActivation,
      'goalActivation': goalActivation,
      'listMonthlyExpense': listMonthlyExpense,
      'monthlyExpense': monthlyExpense,
      'listMonthlyIncome': listMonthlyIncome,
      'monthlyIncome': monthlyIncome,
    };
  }
}
