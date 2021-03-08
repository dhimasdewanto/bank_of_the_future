import 'package:flutter/material.dart';

class BigButtonBottom extends StatelessWidget {
  const BigButtonBottom({
    Key? key,
    required this.onPressed,
    required this.title,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;
  final bool showLoadingIndicator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) => Colors.blue.shade400,
          ),
        ),
        onPressed: onPressed,
        child: showLoadingIndicator
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.canvasColor,
                ),
              )
            : Text(title),
      ),
    );
  }
}
