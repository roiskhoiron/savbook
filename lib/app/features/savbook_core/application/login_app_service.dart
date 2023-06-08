import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/email.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/password.dart';

import '../../../common/exception.dart';
import '../domain/interfaces/i_login_app_service.dart';
import '../domain/interfaces/i_login_factory.dart';
import '../domain/interfaces/i_login_repository.dart';
import '../domain/valueobjects/token.dart';
import '../infrastructure/login_factory.dart';
import '../infrastructure/repository/login_repository.dart';

class LoginAppService implements ILoginAppService {
  final ILoginFactory _factory = Get.find<LoginFactory>();
  final ILoginRepository _repository = Get.find<LoginRepository>();

  @override
  Future<Either<GenericException, Unit>> login(
      {required String email, required String psw}) async {
    // menyiapkan entity untuk data login
    final signIn = _factory.signIn(email: Email(email), psw: Password(psw));

    // validasi data login
    if (!signIn.validate()) {
      return Left(EmptyException(
          code: signIn.password.value.isEmpty
              ? ExceptionCode.signInEmailIsEmpty
              : ExceptionCode.signInPasswordIsEmpty));
    }

    // melakukan prosedur login ke repository
    final result = await _repository.login(signData: signIn);

    if (result.isRight()) {
      // menyiapkan entity untuk data token
      var token =
          _factory.token(token: Token(value: result.getOrElse(() => '')));

      // validasi data token
      if (!token.validate()){
        return Left(EmptyException(
            code: ExceptionCode.signInTokenIsEmpty,
            value: 'Token tidak ditemukan'));
      }

      // melakukan prosedur menyimpan token ke local storage
      var res = await _repository.saveToken(authToken: token);
      return res;
    }

    // jika gagal login
    return Left(ServerRequestException(
        code: ExceptionCode.signInRequestFailure,
        value: 'Terjadi kendala login, coba lagi sesaat'));
  }
}
