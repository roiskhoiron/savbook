import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/requests/login_request.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/response/login_response.dart';

import '../../../../common/exception.dart';
import '../../../../network/provider/api_provider.dart';
import '../../domain/interfaces/i_login_remote_data_source.dart';

class LoginRemoteDataSource implements ILoginRemoteDataSource {
  final _provider = Get.find<APIProvider>();

  @override
  Future<Either<GenericException, LoginResponse>> login(
      {required LoginRequest loginRequest}) async {
    return await _provider
        .postData('/karyawan/login', loginRequest.toJson())
        .then((value) => value.fold((l) => Left(l), (res) {
              if (res.statusCode != 200) {
                return Left(ServerRequestException(
                    code: ExceptionCode.serverFailure,
                    value: res.data['error']));
              } else {
                return Right(LoginResponse.fromJson(res.data));
              }
            }));
  }
}
