import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';

class ScheduleSelectButton extends StatelessWidget {
  const ScheduleSelectButton({
    Key? key,
    required this.title,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String value;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final canvasColor = Theme.of(context).canvasColor;
    final caption = Theme.of(context).textTheme.caption;
    final bodyText1 = Theme.of(context).textTheme.bodyText1;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(sizeM),
      decoration: BoxDecoration(
        color: canvasColor,
        borderRadius: borderRadius,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: caption,
            ),
            const SizedBox(height: sizeS),
            Text(
              value,
              style: bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
