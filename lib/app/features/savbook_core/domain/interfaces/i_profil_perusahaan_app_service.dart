import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/response/profil_perusahaan_response.dart';

abstract class IProfilPerusahaanAppService {
  // use case : mendapatkan data profil perusahaan dari server
  Future<Either<GenericException, ProfilPerusahaanResponse>>
      getProfilPerusahaan();
}
