import 'package:flutter/material.dart';

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("a", style: headline4),
            Text("Lower Case", style: bodyText2),
          ],
        ),
        Column(
          children: [
            Text("A", style: headline4),
            Text("Upper Case", style: bodyText2),
          ],
        ),
        Column(
          children: [
            Text("123", style: headline4),
            Text("Number", style: bodyText2),
          ],
        ),
        Column(
          children: [
            Text("9+", style: headline4),
            Text("Characters", style: bodyText2),
          ],
        ),
      ],
    );
  }
}
