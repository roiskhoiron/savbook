
import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/utility/shared/services/services.dart';

import '../../domain/interfaces/i_login_local_data_source.dart';

class LoginLocalDataSource implements ILoginLocalDataSource {
  @override
  Future<Either<GenericException, Unit>> saveToken(
      {required String token}) async {
    var res =
        await StorageService.setPref(key: StorageEnum.authToken, value: token);
    return res
        ? const Right(unit)
        : Left(LocalStorageException(
            code: ExceptionCode.localStorageFailure,
            value: 'Gagal menyimpan token'));
  }
}
