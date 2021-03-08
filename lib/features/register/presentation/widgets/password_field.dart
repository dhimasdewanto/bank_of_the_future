import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _isHide = true;

  void _hideUnhide() {
    setState(() {
      _isHide = !_isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).canvasColor;
    final textColor = Theme.of(context).textTheme.bodyText1?.color;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: sizeM,
        vertical: sizeS,
      ),
      child: TextField(
        obscureText: _isHide,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: _hideUnhide,
            icon: Icon(
              _isHide ? Icons.visibility_off : Icons.visibility,
              color: textColor,
            ),
          ),
          hintText: "Password",
          border: InputBorder.none,
        ),
        onEditingComplete: () {},
      ),
    );
  }
}
