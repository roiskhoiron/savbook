import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/response/profil_perusahaan_response.dart';

import '../domain/interfaces/i_profil_perusahaan_app_service.dart';
import '../domain/interfaces/i_profil_perusahaan_repository.dart';
import '../infrastructure/repository/profil_perusahaan_repository.dart';

class ProfilPerusahaanAppService implements IProfilPerusahaanAppService {
  final IProfilPerusahaanRepository _repository =
      Get.find<ProfilPerusahaanRepository>();

  Future<Either<GenericException, ProfilPerusahaanResponse>>
      getProfilPerusahaan() async {
    return await _repository.getProfilPerusahaan();
  }
}
