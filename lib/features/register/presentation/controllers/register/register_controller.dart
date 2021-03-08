import 'package:flutter/material.dart';

import '../../../../../core/navigators.dart';
import '../../../../../core/snackbars.dart';
import '../../../domain/use_cases/process_email.dart';
import '../../pages/register_password_page.dart';

part 'register_inherited.dart';
part 'register_state.dart';

class RegisterController extends StatefulWidget {
  const RegisterController({
    Key? key,
    required this.child,
    required this.processEmail,
  }) : super(key: key);

  final Widget child;
  final ProcessEmail processEmail;

  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  final _state = initialRegisterState;

  var _isLoading = false;
  void _setIsLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  Future<void> processEmail(BuildContext currentContext) async {
    if (_isLoading) {
      return;
    }
    _setIsLoading(true);

    try {
      await widget.processEmail(_state.emailController.text);
      await push(
        context: currentContext,
        page: const RegisterPasswordPage(),
      );

      _setIsLoading(false);
    } catch (e) {
      _setIsLoading(false);

      if (e is EmptyEmailException) {
        showSnackBar(
          context: currentContext,
          message: "Email is empty",
        );
        return;
      }
      if (e is EmailInvalidException) {
        showSnackBar(
          context: currentContext,
          message: "Invalid email format",
        );
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegisterInherited(
      controllerState: this,
      state: _state,
      isLoading: _isLoading,
      child: widget.child,
    );
  }
}
