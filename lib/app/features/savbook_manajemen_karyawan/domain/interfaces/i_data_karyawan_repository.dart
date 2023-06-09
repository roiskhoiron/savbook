import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';

import '../../infrastructure/models/response/data_karyawan_response.dart';

abstract class IDataKaryawanRepository {
  Future<Either<GenericException, DataKaryawanResponse>> getAllDataKaryawan();
}
