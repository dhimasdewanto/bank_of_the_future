import 'package:flutter/material.dart';

import '../controllers/register/register_controller.dart';

class PasswordStatusWidget extends StatelessWidget {
  const PasswordStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).canvasColor;
    final headline4 = Theme.of(context).textTheme.headline4?.copyWith(
          color: textColor,
        );
    final bodyText2 = Theme.of(context).textTheme.bodyText2?.copyWith(
          color: textColor,
        );
    final inherit = RegisterInherited.of(context);
    final passwordStatus = inherit.passwordStatus;

    final checkIcon = Icon(
      Icons.check_circle,
      color: Colors.lime,
      size: (headline4?.fontSize ?? 10) + 5,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            if (passwordStatus.hasLowerCase)
              checkIcon
            else
              Text("a", style: headline4),
            Text("Lower Case", style: bodyText2),
          ],
        ),
        Column(
          children: [
            if (passwordStatus.hasUpperCase)
              checkIcon
            else
              Text("A", style: headline4),
            Text("Upper Case", style: bodyText2),
          ],
        ),
        Column(
          children: [
            if (passwordStatus.hasNumber)
              checkIcon
            else
              Text("123", style: headline4),
            Text("Number", style: bodyText2),
          ],
        ),
        Column(
          children: [
            if (passwordStatus.hasTotal)
              checkIcon
            else
              Text("9+", style: headline4),
            Text("Characters", style: bodyText2),
          ],
        ),
      ],
    );
  }
}
