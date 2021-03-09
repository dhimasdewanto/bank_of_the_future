import 'package:flutter/material.dart';

import '../../../../../core/navigators.dart';
import '../../../../../core/snackbars.dart';
import '../../../domain/entitites/password_status.dart';
import '../../../domain/use_cases/check_password_status.dart';
import '../../../domain/use_cases/process_email.dart';
import '../../pages/register_password_page.dart';
import '../../pages/register_personal_page.dart';

part 'register_inherited.dart';
part 'register_state.dart';

class RegisterController extends StatefulWidget {
  const RegisterController({
    Key? key,
    required this.child,
    required this.processEmail,
    required this.checkPasswordStatus,
  }) : super(key: key);

  final Widget child;
  final ProcessEmail processEmail;
  final CheckPasswordStatus checkPasswordStatus;

  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  RegisterState _state = const ReadyRegisterState();
  RegisterState get state => _state;
  set state(RegisterState newState) {
    setState(() {
      _state = newState;
    });
  }

  PasswordStatus _passwordStatus = PasswordStatus();
  PasswordStatus get passwordStatus => _passwordStatus;
  set passwordStatus(PasswordStatus value) {
    setState(() {
      _passwordStatus = value;
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void checkPasswordStatus() {
    passwordStatus = widget.checkPasswordStatus(passwordController.text);
  }

  void processPassword(BuildContext currentContext) {
    if (passwordStatus.hasLowerCase &&
        passwordStatus.hasUpperCase &&
        passwordStatus.hasNumber &&
        passwordStatus.hasTotal) {
      push(
        context: currentContext,
        page: const RegisterPersonalPage(),
      );
      return;
    }
    showSnackBar(
      context: currentContext,
      message: "Please fill correct password",
    );
  }

  Future<void> processEmail(BuildContext currentContext) async {
    // Hide keyboard
    FocusScope.of(currentContext).unfocus();

    if (state is LoadingRegisterState) {
      return;
    }
    state = const LoadingRegisterState();

    try {
      await widget.processEmail(emailController.text);
      await push(
        context: currentContext,
        page: const RegisterPasswordPage(),
      );

      state = const ReadyRegisterState();
    } catch (e) {
      state = const ReadyRegisterState();

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
      passwordStatus: passwordStatus,
      child: widget.child,
    );
  }
}
