import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';

import '../../infrastructure/models/requests/login_request.dart';
import '../../infrastructure/models/response/login_response.dart';

abstract class ILoginRemoteDataSource {
  /// fungsi ini akan mengeksekusi http login ke server
  Future<Either<GenericException, LoginResponse>> login(
      {required LoginRequest loginRequest});
}
