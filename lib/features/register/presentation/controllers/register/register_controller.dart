import 'package:flutter/material.dart';

part 'register_inherited.dart';
part 'register_state.dart';

class RegisterController extends StatefulWidget {
  const RegisterController({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  final _state = initialRegisterState;

  @override
  Widget build(BuildContext context) {
    return RegisterInherited(
      controllerState: this,
      state: _state,
      child: widget.child,
    );
  }
}
