import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';

import '../../infrastructure/models/response/data_karyawan_response.dart';

abstract class IDataKaryawanAppService {
  Future<Either<GenericException, List<DataKaryawan>>> getDataKaryawan();
}
