import 'package:savbook/app/features/savbook_core/domain/entities/profil_perusahaan.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/foto.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/misi.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/tentang.dart';
import 'package:savbook/app/features/savbook_core/domain/valueobjects/visi.dart';

abstract class IProfilPerusahaanFactory {
  // menciptakan objek ProfilPerusahaan
  ProfilPerusahaan profilePerusahaan(
      {required Visi visi,
      required Misi misi,
      required Tentang tentang,
      required Foto foto,
      required Foto gambarStrukturOrganisasi});
}
