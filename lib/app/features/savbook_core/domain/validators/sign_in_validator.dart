import 'package:savbook/app/features/savbook_core/domain/valueobjects/email.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/password.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/token.dart';

mixin SignInValidator {
  bool onValidate({required Email email, required Password password}) {
    if (email.value.isEmpty || password.value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool onValidateToken({required Token token}) {
    if (token.value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
