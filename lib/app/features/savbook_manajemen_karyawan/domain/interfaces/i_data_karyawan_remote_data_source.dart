import 'package:dartz/dartz.dart';

import '../../../../common/exception.dart';
import '../../infrastructure/models/response/data_karyawan_response.dart';

abstract class IDataKaryawanRemoteDataSource {
  Future<Either<GenericException, DataKaryawanResponse>> getDataKaryawan();
}
