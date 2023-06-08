import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_core/domain/entities/auth_token_data.dart';
import 'package:savbook/app/features/savbook_core/domain/entities/sign_data.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/requests/login_request.dart';

import '../../domain/interfaces/i_login_local_data_source.dart';
import '../../domain/interfaces/i_login_remote_data_source.dart';
import '../../domain/interfaces/i_login_repository.dart';
import '../datasource/login_local_data_source.dart';
import '../datasource/login_remote_data_source.dart';

class LoginRepository implements ILoginRepository {
  final ILoginRemoteDataSource _remoteDataSource =
      Get.find<LoginRemoteDataSource>();
  final ILoginLocalDataSource _localDataSource =
      Get.find<LoginLocalDataSource>();

  @override
  Future<Either<GenericException, String>> login(
      {required SignData signData}) async {
    var result = await _remoteDataSource.login(
        loginRequest: LoginRequest(
            email: signData.email.value, password: signData.password.value));
    return result.fold((l) => Left(l), (r) => Right(r.data.accessToken));
  }

  @override
  Future<Either<GenericException, Unit>> saveToken(
      {required AuthToken authToken}) async {
    return await _localDataSource.saveToken(token: authToken.token.value);
  }
}
