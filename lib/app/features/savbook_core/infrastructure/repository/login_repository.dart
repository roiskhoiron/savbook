import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_core/domain/entities/sign_data.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/requests/login_request.dart';

import '../../domain/interfaces/i_login_remote_data_source.dart';
import '../../domain/interfaces/i_login_repository.dart';
import '../datasource/login_remote_data_source.dart';

class LoginRepository implements ILoginRepository {
  final ILoginRemoteDataSource _remoteDataSource =
      Get.find<LoginRemoteDataSource>();

  @override
  Future<Either<GenericException, bool>> login(
      {required SignData signData}) async {
    var result = await _remoteDataSource.login(
        loginRequest: LoginRequest(
            email: signData.email.value, password: signData.password.value));
    return result.fold((l) => Left(l), (r) => Right(r.status));
  }
}
