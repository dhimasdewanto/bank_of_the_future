part of 'register_controller.dart';

RegisterState get initialRegisterState {
  return RegisterState(
    emailController: TextEditingController(),
  );
}

class RegisterState {
  const RegisterState({
    required this.emailController,
  });

  final TextEditingController emailController;

  RegisterState copyWith({
    TextEditingController? emailController,
  }) {
    return RegisterState(
      emailController: emailController ?? this.emailController,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is RegisterState && o.emailController == emailController;
  }

  @override
  int get hashCode => emailController.hashCode;
}
