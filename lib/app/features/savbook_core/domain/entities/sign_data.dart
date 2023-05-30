import '../validators/sign_in_validator.dart';
import '../valueobjects/email.dart';
import '../valueobjects/password.dart';

class SignData extends SignInValidator{
  final Email email;
  final Password password;

  SignData({
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignData &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  @override
  bool validate() => super.onValidate(email: email, password: password);
}
