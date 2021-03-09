part of 'register_controller.dart';

abstract class RegisterState {
  const RegisterState();
}

class EmailLoadingState extends RegisterState {
  const EmailLoadingState();
}

class ReadyRegisterState extends RegisterState {
  const ReadyRegisterState();
}