import 'package:savbook/app/features/savbook_core/domain/entities/profil_perusahaan.dart';
import 'package:savbook/app/features/savbook_core/domain/interfaces/i_profil_perusahaan_factory.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/foto.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/misi.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/tentang.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/visi.dart';

class ProfilPerusahaanFactory implements IProfilPerusahaanFactory {
  @override
  ProfilPerusahaan profilePerusahaan(
      {required Visi visi,
      required Misi misi,
      required Tentang tentang,
      required Foto foto,
      required Foto gambarStrukturOrganisasi}) {
    return ProfilPerusahaan(
        visi: visi,
        misi: misi,
        tentang: tentang,
        foto: foto,
        gambarStrukturOrganisasi: gambarStrukturOrganisasi);
  }
}
