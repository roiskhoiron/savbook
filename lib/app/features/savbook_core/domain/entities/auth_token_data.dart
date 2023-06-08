import 'package:savbook/app/features/savbook_core/domain/validators/sign_in_validator.dart';

import '../valueobjects/token.dart';

class AuthToken with SignInValidator {
  final Token token;

  AuthToken({required this.token});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthToken && other.token == token;
  }

  bool validate() => super.onValidateToken(token: token);
}
