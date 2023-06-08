import 'package:savbook/app/features/savbook_core/domain/valueobjects/email.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/password.dart';

import '../entities/auth_token_data.dart';
import '../entities/sign_data.dart';
import '../valueobjects/token.dart';

abstract class ILoginFactory {
  /// fungsi ini digunakan untuk membuat objek atau entitas data sign in
  SignData signIn({required Email email, required Password psw});

  AuthToken token({required Token token});
}
