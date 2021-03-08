part of 'register_controller.dart';

class RegisterInherited extends InheritedWidget {
  const RegisterInherited({
    Key? key,
    required this.controllerState,
    required this.state,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  factory RegisterInherited.of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RegisterInherited>() ??
        RegisterInherited(
          controllerState: _RegisterControllerState(),
          state: initialRegisterState,
          child: const Offstage(),
        );
  }

  final _RegisterControllerState controllerState;
  final RegisterState state;

  @override
  bool updateShouldNotify(RegisterInherited oldWidget) {
    return oldWidget.state != state;
  }
}
