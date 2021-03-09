import 'package:flutter/material.dart';

import '../../../../../core/navigators.dart';
import '../../../../../core/snackbars.dart';
import '../../../domain/entitites/password_status.dart';
import '../../../domain/entitites/personal_information.dart';
import '../../../domain/use_cases/check_password_status.dart';
import '../../../domain/use_cases/process_email.dart';
import '../../pages/register_password_page.dart';
import '../../pages/register_personal_page.dart';
import '../../pages/register_schedule_page.dart';

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

  PersonalInformation _personalInformation = PersonalInformation(
    listGoalActivation: const [
      'Retirement',
      'Saving',
      'Marriage',
    ],
    listMonthlyExpense: const [
      'Rp. 0 - 5.000.000',
      'Rp. 5.000.000 - 10.000.000',
      '> Rp. 10.000.000',
    ],
    listMonthlyIncome: const [
      'Rp. 0 - 5.000.000',
      'Rp. 5.000.000 - 10.000.000',
      '> Rp. 10.000.000',
    ],
  );
  PersonalInformation get personalInformation => _personalInformation;
  set personalInformation(PersonalInformation personalInformation) {
    setState(() {
      _personalInformation = personalInformation;
    });
  }

  DateTime? _scheduleVideoCall;
  DateTime? get scheduleVideoCall => _scheduleVideoCall;
  set scheduleVideoCall(DateTime? scheduleVideoCall) {
    setState(() {
      _scheduleVideoCall = scheduleVideoCall;
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void checkPasswordStatus() {
    passwordStatus = widget.checkPasswordStatus(passwordController.text);
  }

  void processSchedule(BuildContext currentContext) {
    if (scheduleVideoCall == null) {
      showSnackBar(
        context: currentContext,
        message: "Please select schedule for video call",
      );
    } else {
      showSnackBar(
        context: currentContext,
        message: "Success register",
      );
    }
  }

  void processPersonalInformation(BuildContext currentContext) {
    if (personalInformation.goalActivation != null &&
        personalInformation.monthlyExpense != null &&
        personalInformation.monthlyIncome != null) {
      push(
        context: currentContext,
        page: const RegisterSchedulePage(),
      );
      return;
    }
    showSnackBar(
      context: currentContext,
      message: "Please fill all personal information",
    );
  }

  void processPassword(BuildContext currentContext) {
    // Hide keyboard
    FocusScope.of(currentContext).unfocus();

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
      personalInformation: personalInformation,
      scheduleVideoCall: scheduleVideoCall,
      child: widget.child,
    );
  }
}
