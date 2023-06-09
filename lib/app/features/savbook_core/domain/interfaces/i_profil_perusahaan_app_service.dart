import 'package:dartz/dartz.dart';
import 'package:savbook/app/common/exception.dart';

import '../entities/profil_perusahaan.dart';

abstract class IProfilPerusahaanAppService {
  // use case : mendapatkan data profil perusahaan dari infrastruktur
  Future<Either<GenericException, ProfilPerusahaan>> getProfilPerusahaan();
}
