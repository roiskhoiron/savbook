import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/response/profil_perusahaan_response.dart';

import '../../../../common/exception.dart';
import '../../domain/interfaces/i_profil_perusahaan_remote_data_source.dart';
import '../../domain/interfaces/i_profil_perusahaan_repository.dart';
import '../datasource/profil_perusahaan_remote_data_source.dart';

class ProfilPerusahaanRepository implements IProfilPerusahaanRepository {
  final IProfilPerusahaanRemoteDataSource _remoteDataSource =
      Get.find<ProfilPerusahaanRemoteDataSource>();

  @override
  Future<Either<GenericException, ProfilPerusahaanResponse>>
      getProfilPerusahaan() async {
    try {
      return await _remoteDataSource.getProfilPerusahaan();
    } on GenericException catch (e) {
      return Left(e);
    }
  }
}
