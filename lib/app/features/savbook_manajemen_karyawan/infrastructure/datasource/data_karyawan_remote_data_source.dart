import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_manajemen_karyawan/infrastructure/models/response/data_karyawan_response.dart';
import 'package:savbook/app/network/provider/api_provider.dart';

import '../../domain/interfaces/i_data_karyawan_remote_data_source.dart';

class DataKaryawanRemoteDataSource implements IDataKaryawanRemoteDataSource {
  final _apiProvider = Get.find<APIProvider>();

  @override
  Future<Either<GenericException, DataKaryawanResponse>>
      getDataKaryawan() async {
    return await _apiProvider
        .getData('/karyawan/all')
        .then((value) => value.fold((l) => Left(l), (r) {
              if (r.statusCode != 200) {
                return Left(ServerRequestException(
                    code: ExceptionCode.serverFailure, value: r.data['error']));
              } else {
                return Right(DataKaryawanResponse.fromJson(r.data));
              }
            }));
  }
}
