// To parse this JSON data, do
//
//     final profilPerusahaanResponse = profilPerusahaanResponseFromJson(jsonString);

import 'dart:convert';

ProfilPerusahaanResponse profilPerusahaanResponseFromJson(String str) =>
    ProfilPerusahaanResponse.fromJson(json.decode(str));

String profilPerusahaanResponseToJson(ProfilPerusahaanResponse data) =>
    json.encode(data.toJson());

class ProfilPerusahaanResponse {
  bool success;
  String message;
  Data data;

  ProfilPerusahaanResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfilPerusahaanResponse.fromJson(Map<String, dynamic> json) =>
      ProfilPerusahaanResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String idPerusahaan;
  String namaPerusahaan;
  String tentang;
  String visi;
  String misi;
  String? foto;
  String? gambarStrukturOrganisasi;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.idPerusahaan,
    required this.namaPerusahaan,
    required this.tentang,
    required this.visi,
    required this.misi,
    this.foto,
    this.gambarStrukturOrganisasi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idPerusahaan: json["id_perusahaan"],
        namaPerusahaan: json["nama_perusahaan"],
        tentang: json["tentang"],
        visi: json["visi"],
        misi: json["misi"],
        foto: json["foto"],
        gambarStrukturOrganisasi: json["gambar_struktur_organisasi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_perusahaan": idPerusahaan,
        "nama_perusahaan": namaPerusahaan,
        "tentang": tentang,
        "visi": visi,
        "misi": misi,
        "foto": foto,
        "gambar_struktur_organisasi": gambarStrukturOrganisasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
