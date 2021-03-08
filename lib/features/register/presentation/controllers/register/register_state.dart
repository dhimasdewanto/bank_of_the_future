part of 'register_controller.dart';

abstract class RegisterState {
  const RegisterState();
}

class LoadingRegisterState extends RegisterState {
  const LoadingRegisterState();
}

class ReadyRegisterState extends RegisterState {
  const ReadyRegisterState();
}