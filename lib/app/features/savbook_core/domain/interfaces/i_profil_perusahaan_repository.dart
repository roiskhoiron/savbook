import 'package:dartz/dartz.dart';
import 'package:savbook/app/features/savbook_core/infrastructure/models/response/profil_perusahaan_response.dart';

import '../../../../common/exception.dart';

abstract class IProfilPerusahaanRepository {
  // mendapatkan data profil perusahaan dari server
  Future<Either<GenericException, ProfilPerusahaanResponse>>
      getProfilPerusahaan();
}
