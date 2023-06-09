import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_manajemen_karyawan/domain/interfaces/i_data_karyawan_repository.dart';
import 'package:savbook/app/features/savbook_manajemen_karyawan/infrastructure/models/response/data_karyawan_response.dart';

import '../../domain/interfaces/i_data_karyawan_remote_data_source.dart';
import '../datasource/data_karyawan_remote_data_source.dart';

class DataKaryawanRepository implements IDataKaryawanRepository {
  final IDataKaryawanRemoteDataSource _remoteDataSource =
      Get.find<DataKaryawanRemoteDataSource>();

  @override
  Future<Either<GenericException, DataKaryawanResponse>> getAllDataKaryawan() {
    return _remoteDataSource.getDataKaryawan();
  }
}
