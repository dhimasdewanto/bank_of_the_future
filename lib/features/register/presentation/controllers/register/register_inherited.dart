part of 'register_controller.dart';

class RegisterInherited extends InheritedWidget {
  const RegisterInherited({
    Key? key,
    required this.controllerState,
    required this.state,
    required this.passwordStatus,
    required this.personalInformation,
    required Widget child,
    this.scheduleVideoCall,
  }) : super(
          key: key,
          child: child,
        );

  factory RegisterInherited.of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RegisterInherited>() ??
        RegisterInherited(
          controllerState: _RegisterControllerState(),
          state: const ReadyRegisterState(),
          passwordStatus: PasswordStatus(),
          personalInformation: PersonalInformation(
            listGoalActivation: [],
            listMonthlyExpense: [],
            listMonthlyIncome: [],
          ),
          child: const Offstage(),
        );
  }

  final _RegisterControllerState controllerState;
  final RegisterState state;
  final PasswordStatus passwordStatus;
  final PersonalInformation personalInformation;
  final DateTime? scheduleVideoCall;

  @override
  bool updateShouldNotify(RegisterInherited oldWidget) {
    return oldWidget.state != state ||
        oldWidget.passwordStatus != passwordStatus ||
        oldWidget.personalInformation != personalInformation ||
        oldWidget.scheduleVideoCall != scheduleVideoCall;
  }
}
