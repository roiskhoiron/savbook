import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../common/exception.dart';
import '../domain/entities/profil_perusahaan.dart';
import '../domain/interfaces/i_profil_perusahaan_app_service.dart';
import '../domain/interfaces/i_profil_perusahaan_factory.dart';
import '../domain/interfaces/i_profil_perusahaan_repository.dart';
import '../domain/valueobjects/foto.dart';
import '../domain/valueobjects/misi.dart';
import '../domain/valueobjects/tentang.dart';
import '../domain/valueobjects/visi.dart';
import '../infrastructure/factories/profil_perusahaan_factory.dart';
import '../infrastructure/repository/profil_perusahaan_repository.dart';

class ProfilPerusahaanAppService implements IProfilPerusahaanAppService {
  final IProfilPerusahaanRepository _repository =
      Get.find<ProfilPerusahaanRepository>();
  final IProfilPerusahaanFactory _factory = Get.find<ProfilPerusahaanFactory>();

  @override
  Future<Either<GenericException, ProfilPerusahaan>>
      getProfilPerusahaan() async {
    final res = await _repository.getProfilPerusahaan();
    return res.fold(
        (l) => Left(l),
        (r) => Right(_factory.profilePerusahaan(
            visi: Visi(r.data.visi),
            misi: Misi(r.data.misi),
            tentang: Tentang(r.data.tentang),
            foto: Foto(r.data.foto ?? ''),
            gambarStrukturOrganisasi:
                Foto(r.data.gambarStrukturOrganisasi ?? ''))));
  }
}
