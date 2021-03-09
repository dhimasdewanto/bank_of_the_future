import 'package:flutter/material.dart';

import '../../../../core/app_settings.dart';
import '../controllers/register/register_controller.dart';

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
    final inherit = RegisterInherited.of(context);
    final controller = inherit.controllerState;

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
        controller: controller.passwordController,
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
        onChanged: (_) => controller.checkPasswordStatus(),
        onEditingComplete: () => controller.processPassword(context),
      ),
    );
  }
}
