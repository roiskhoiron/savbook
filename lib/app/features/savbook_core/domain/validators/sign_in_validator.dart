import 'package:savbook/app/features/savbook_core/domain/valueobjects/email.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/password.dart';

class SignInValidator {
  bool onValidate({required Email email, required Password password}) {
    if (email.value.isEmpty || password.value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}