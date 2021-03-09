import 'package:flutter/material.dart';

import '../../domain/entitites/password_strength.dart';
import '../controllers/register/register_controller.dart';

class PasswordComplexityWidget extends StatelessWidget {
  const PasswordComplexityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).canvasColor;
    final bodyText1 = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: textColor,
        );
    final inherit = RegisterInherited.of(context);
    final passwordStrength = inherit.passwordStatus.strength;

    var complexity = "";
    var color = Colors.amber;
    if (passwordStrength == PasswordStrength.veryWeak) {
      complexity = "Very Weak";
    }
    if (passwordStrength == PasswordStrength.weak) {
      complexity = "Weak";
    }
    if (passwordStrength == PasswordStrength.strong) {
      complexity = "Strong";
      color = Colors.lime;
    }
    if (passwordStrength == PasswordStrength.veryStrong) {
      complexity = "Very Strong";
      color = Colors.lime;
    }

    return Row(
      children: [
        Text(
          "Complexity: ",
          style: bodyText1,
        ),
        Text(
          complexity,
          style: bodyText1?.copyWith(
            color:  color,
          ),
        ),
      ],
    );
  }
}
