import 'package:dartz/dartz.dart';

import '../../../../common/exception.dart';

abstract class ILoginAppService {
  /// fungsi ini untuk meminta prosedur usecase login akun
  Future<Either<GenericException, Unit>> login(
      {required String email, required String psw});
}
