import 'package:savbook/app/features/savbook_core/domain/entities/auth_token_data.dart';
import 'package:savbook/app/features/savbook_core/domain/entities/sign_data.dart';
import 'package:savbook/app/features/savbook_core/domain/interfaces/i_login_factory.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/email.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/password.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/token.dart';

class LoginFactory implements ILoginFactory {
  @override
  SignData signIn({required Email email, required Password psw}) =>
      SignData(email: email, password: psw);

  @override
  AuthToken token({required Token token}) => AuthToken(token: token);
}
