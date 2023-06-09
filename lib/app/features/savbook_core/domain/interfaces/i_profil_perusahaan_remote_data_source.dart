import 'package:dartz/dartz.dart';

import '../../../../common/exception.dart';
import '../../infrastructure/models/response/profil_perusahaan_response.dart';

abstract class IProfilPerusahaanRemoteDataSource {
  // hit api get profil perusahaan
  Future<Either<GenericException, ProfilPerusahaanResponse>>
      getProfilPerusahaan();
}
