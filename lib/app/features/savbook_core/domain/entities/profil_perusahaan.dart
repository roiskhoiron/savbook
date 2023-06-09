import '../valueobjects/foto.dart';
import '../valueobjects/misi.dart';
import '../valueobjects/tentang.dart';
import '../valueobjects/visi.dart';

class ProfilPerusahaan {
  final Visi visi;
  final Misi misi;
  final Tentang tentang;
  final Foto foto;
  final Foto gambarStrukturOrganisasi;

  ProfilPerusahaan(
      {required this.visi,
      required this.misi,
      required this.tentang,
      required this.foto,
      required this.gambarStrukturOrganisasi});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfilPerusahaan &&
          runtimeType == other.runtimeType &&
          visi == other.visi &&
          misi == other.misi &&
          tentang == other.tentang &&
          foto == other.foto &&
          gambarStrukturOrganisasi == other.gambarStrukturOrganisasi;

  @override
  int get hashCode =>
      visi.hashCode ^
      misi.hashCode ^
      tentang.hashCode ^
      foto.hashCode ^
      gambarStrukturOrganisasi.hashCode;
}
