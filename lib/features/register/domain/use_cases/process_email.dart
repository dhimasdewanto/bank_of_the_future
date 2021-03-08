class ProcessEmail {
  Future<void> call(String email) async {
    if (email.isEmpty) {
      throw const EmptyEmailException();
    }
    
    await Future.delayed(const Duration(seconds: 1), () {
      final isEmailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

      if (isEmailValid == false) {
        throw const EmailInvalidException();
      }
    });
  }
}

class EmptyEmailException implements Exception {
  const EmptyEmailException();
}

class EmailInvalidException implements Exception {
  const EmailInvalidException();
}
