import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../common/exception.dart';
import '../domain/interfaces/i_data_karyawan_app_service.dart';
import '../domain/interfaces/i_data_karyawan_repository.dart';
import '../infrastructure/models/response/data_karyawan_response.dart';
import '../infrastructure/repository/data_karyawan_repository.dart';

class DataKaryawanAppService implements IDataKaryawanAppService {
  final IDataKaryawanRepository _repository =
      Get.find<DataKaryawanRepository>();

  @override
  Future<Either<GenericException, List<DataKaryawan>>> getDataKaryawan() async {
    final res = await _repository.getAllDataKaryawan();
    return res.fold((l) => Left(l), (r) {
      return Right(r.data);
    });
  }
}
