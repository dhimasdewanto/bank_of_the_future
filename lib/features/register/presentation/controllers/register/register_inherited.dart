part of 'register_controller.dart';

class RegisterInherited extends InheritedWidget {
  const RegisterInherited({
    Key? key,
    required this.controllerState,
    required this.state,
    required this.passwordStatus,
    required Widget child,
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
          child: const Offstage(),
        );
  }

  final _RegisterControllerState controllerState;
  final RegisterState state;
  final PasswordStatus passwordStatus;

  @override
  bool updateShouldNotify(RegisterInherited oldWidget) {
    return oldWidget.state != state || oldWidget.passwordStatus != passwordStatus;
  }
}
