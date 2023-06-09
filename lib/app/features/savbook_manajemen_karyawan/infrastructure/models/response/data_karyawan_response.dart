// To parse this JSON data, do
//
//     final dataKaryawanResponse = dataKaryawanResponseFromJson(jsonString);

import 'dart:convert';

DataKaryawanResponse dataKaryawanResponseFromJson(String str) =>
    DataKaryawanResponse.fromJson(json.decode(str));

String dataKaryawanResponseToJson(DataKaryawanResponse data) =>
    json.encode(data.toJson());

class DataKaryawanResponse {
  bool status;
  String message;
  List<DataKaryawan> data;

  DataKaryawanResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DataKaryawanResponse.fromJson(Map<String, dynamic> json) =>
      DataKaryawanResponse(
        status: json["status"],
        message: json["message"],
        data: List<DataKaryawan>.from(
            json["data"].map((x) => DataKaryawan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataKaryawan {
  Profil profil;
  List<Pendidikan> pendidikan;
  List<Pengalaman> pengalaman;
  List<Keluarga> keluarga;
  List<Bahasa> bahasa;
  List<dynamic> kontrak;
  List<dynamic> inventaris;
  List<dynamic> pengajuan;
  User user;

  DataKaryawan({
    required this.profil,
    required this.pendidikan,
    required this.pengalaman,
    required this.keluarga,
    required this.bahasa,
    required this.kontrak,
    required this.inventaris,
    required this.pengajuan,
    required this.user,
  });

  factory DataKaryawan.fromJson(Map<String, dynamic> json) => DataKaryawan(
        profil: Profil.fromJson(json["profil"]),
        pendidikan: List<Pendidikan>.from(
            json["pendidikan"].map((x) => Pendidikan.fromJson(x))),
        pengalaman: List<Pengalaman>.from(
            json["pengalaman"].map((x) => Pengalaman.fromJson(x))),
        keluarga: List<Keluarga>.from(
            json["keluarga"].map((x) => Keluarga.fromJson(x))),
        bahasa:
            List<Bahasa>.from(json["bahasa"].map((x) => Bahasa.fromJson(x))),
        kontrak: List<dynamic>.from(json["kontrak"].map((x) => x)),
        inventaris: List<dynamic>.from(json["inventaris"].map((x) => x)),
        pengajuan: List<dynamic>.from(json["pengajuan"].map((x) => x)),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "profil": profil.toJson(),
        "pendidikan": List<dynamic>.from(pendidikan.map((x) => x.toJson())),
        "pengalaman": List<dynamic>.from(pengalaman.map((x) => x.toJson())),
        "keluarga": List<dynamic>.from(keluarga.map((x) => x.toJson())),
        "bahasa": List<dynamic>.from(bahasa.map((x) => x.toJson())),
        "kontrak": List<dynamic>.from(kontrak.map((x) => x)),
        "inventaris": List<dynamic>.from(inventaris.map((x) => x)),
        "pengajuan": List<dynamic>.from(pengajuan.map((x) => x)),
        "user": user.toJson(),
      };
}

class Bahasa {
  int idInfoKemampuanBahas;
  String noKaryawan;
  String jenisBahasa;
  String mendengar;
  String membaca;
  String menulis;
  String berbicara;
  DateTime createdAt;
  DateTime updatedAt;

  Bahasa({
    required this.idInfoKemampuanBahas,
    required this.noKaryawan,
    required this.jenisBahasa,
    required this.mendengar,
    required this.membaca,
    required this.menulis,
    required this.berbicara,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Bahasa.fromJson(Map<String, dynamic> json) => Bahasa(
        idInfoKemampuanBahas: json["id_info_kemampuan_bahas"],
        noKaryawan: json["no_karyawan"],
        jenisBahasa: json["jenis_bahasa"],
        mendengar: json["mendengar"],
        membaca: json["membaca"],
        menulis: json["menulis"],
        berbicara: json["berbicara"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_info_kemampuan_bahas": idInfoKemampuanBahas,
        "no_karyawan": noKaryawan,
        "jenis_bahasa": jenisBahasa,
        "mendengar": mendengar,
        "membaca": membaca,
        "menulis": menulis,
        "berbicara": berbicara,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Keluarga {
  int idInfoKeluarga;
  String noKaryawan;
  String namaAnggota;
  String statusHubungan;
  String tempatLahir;
  DateTime tanggalLahir;
  String alamat;
  String jenisKelamin;
  String pendidikan;
  String pekerjaan;
  String kontak;
  DateTime createdAt;
  DateTime updatedAt;

  Keluarga({
    required this.idInfoKeluarga,
    required this.noKaryawan,
    required this.namaAnggota,
    required this.statusHubungan,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.alamat,
    required this.jenisKelamin,
    required this.pendidikan,
    required this.pekerjaan,
    required this.kontak,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Keluarga.fromJson(Map<String, dynamic> json) => Keluarga(
        idInfoKeluarga: json["id_info_keluarga"],
        noKaryawan: json["no_karyawan"],
        namaAnggota: json["nama_anggota"],
        statusHubungan: json["status_hubungan"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        alamat: json["alamat"],
        jenisKelamin: json["jenis_kelamin"],
        pendidikan: json["pendidikan"],
        pekerjaan: json["pekerjaan"],
        kontak: json["kontak"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_info_keluarga": idInfoKeluarga,
        "no_karyawan": noKaryawan,
        "nama_anggota": namaAnggota,
        "status_hubungan": statusHubungan,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir.toIso8601String(),
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "pendidikan": pendidikan,
        "pekerjaan": pekerjaan,
        "kontak": kontak,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Pendidikan {
  int idInfoPendidikan;
  String noKaryawan;
  String namaInstitusi;
  String jenisPendidikan;
  String programStudi;
  DateTime mulai;
  DateTime berakhir;
  double nilaiKumulatif;
  String statusKelulusan;
  DateTime createdAt;
  DateTime updatedAt;

  Pendidikan({
    required this.idInfoPendidikan,
    required this.noKaryawan,
    required this.namaInstitusi,
    required this.jenisPendidikan,
    required this.programStudi,
    required this.mulai,
    required this.berakhir,
    required this.nilaiKumulatif,
    required this.statusKelulusan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pendidikan.fromJson(Map<String, dynamic> json) => Pendidikan(
        idInfoPendidikan: json["id_info_pendidikan"],
        noKaryawan: json["no_karyawan"],
        namaInstitusi: json["nama_institusi"],
        jenisPendidikan: json["jenis_pendidikan"],
        programStudi: json["program_studi"],
        mulai: DateTime.parse(json["mulai"]),
        berakhir: DateTime.parse(json["berakhir"]),
        nilaiKumulatif: json["nilai_kumulatif"]?.toDouble(),
        statusKelulusan: json["status_kelulusan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_info_pendidikan": idInfoPendidikan,
        "no_karyawan": noKaryawan,
        "nama_institusi": namaInstitusi,
        "jenis_pendidikan": jenisPendidikan,
        "program_studi": programStudi,
        "mulai": mulai.toIso8601String(),
        "berakhir": berakhir.toIso8601String(),
        "nilai_kumulatif": nilaiKumulatif,
        "status_kelulusan": statusKelulusan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Pengalaman {
  int idInfoPengalamanKerja;
  String noKaryawan;
  String namaPerusahaan;
  String alamatPerusahaan;
  DateTime mulai;
  DateTime berakhir;
  String jabatanTerakhir;
  String deskripsiPekerjaan;
  dynamic noTelpPerusahaan;
  String namaSupervisi;
  int gaji;
  String alasan;
  DateTime createdAt;
  DateTime updatedAt;

  Pengalaman({
    required this.idInfoPengalamanKerja,
    required this.noKaryawan,
    required this.namaPerusahaan,
    required this.alamatPerusahaan,
    required this.mulai,
    required this.berakhir,
    required this.jabatanTerakhir,
    required this.deskripsiPekerjaan,
    this.noTelpPerusahaan,
    required this.namaSupervisi,
    required this.gaji,
    required this.alasan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pengalaman.fromJson(Map<String, dynamic> json) => Pengalaman(
        idInfoPengalamanKerja: json["id_info_pengalaman_kerja"],
        noKaryawan: json["no_karyawan"],
        namaPerusahaan: json["nama_perusahaan"],
        alamatPerusahaan: json["alamat_perusahaan"],
        mulai: DateTime.parse(json["mulai"]),
        berakhir: DateTime.parse(json["berakhir"]),
        jabatanTerakhir: json["jabatan_terakhir"],
        deskripsiPekerjaan: json["deskripsi_pekerjaan"],
        noTelpPerusahaan: json["no_telp_perusahaan"],
        namaSupervisi: json["nama_supervisi"],
        gaji: json["gaji"],
        alasan: json["alasan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_info_pengalaman_kerja": idInfoPengalamanKerja,
        "no_karyawan": noKaryawan,
        "nama_perusahaan": namaPerusahaan,
        "alamat_perusahaan": alamatPerusahaan,
        "mulai": mulai.toIso8601String(),
        "berakhir": berakhir.toIso8601String(),
        "jabatan_terakhir": jabatanTerakhir,
        "deskripsi_pekerjaan": deskripsiPekerjaan,
        "no_telp_perusahaan": noTelpPerusahaan,
        "nama_supervisi": namaSupervisi,
        "gaji": gaji,
        "alasan": alasan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Profil {
  String noKaryawan;
  String namaLengkap;
  String namaPanggilan;
  String alamatLengkap;
  String email;
  String noHp;
  String noTelp;
  String tempatLahir;
  DateTime tanggalLahir;
  String golonganDarah;
  String jenisKelamin;
  String agama;
  String sukuBangsa;
  String noKtp;
  DateTime kadaluarsaKtp;
  String jenisSim;
  DateTime kadaluarsaSim;
  String statusPernikahan;
  String statusTempatTinggal;
  String noRekening;
  String cabangRekening;
  String noNpwp;
  DateTime tanggalTerdaftarNpwp;
  String namaWali;
  String hpWali;
  String telpRumahWali;
  String telpKantorWali;
  String alamatWali;
  DateTime createdAt;
  DateTime updatedAt;

  Profil({
    required this.noKaryawan,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.alamatLengkap,
    required this.email,
    required this.noHp,
    required this.noTelp,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.golonganDarah,
    required this.jenisKelamin,
    required this.agama,
    required this.sukuBangsa,
    required this.noKtp,
    required this.kadaluarsaKtp,
    required this.jenisSim,
    required this.kadaluarsaSim,
    required this.statusPernikahan,
    required this.statusTempatTinggal,
    required this.noRekening,
    required this.cabangRekening,
    required this.noNpwp,
    required this.tanggalTerdaftarNpwp,
    required this.namaWali,
    required this.hpWali,
    required this.telpRumahWali,
    required this.telpKantorWali,
    required this.alamatWali,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profil.fromJson(Map<String, dynamic> json) => Profil(
        noKaryawan: json["no_karyawan"],
        namaLengkap: json["nama_lengkap"],
        namaPanggilan: json["nama_panggilan"],
        alamatLengkap: json["alamat_lengkap"],
        email: json["email"],
        noHp: json["no_hp"],
        noTelp: json["no_telp"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        golonganDarah: json["golongan_darah"],
        jenisKelamin: json["jenis_kelamin"],
        agama: json["agama"],
        sukuBangsa: json["suku_bangsa"],
        noKtp: json["no_ktp"],
        kadaluarsaKtp: DateTime.parse(json["kadaluarsa_ktp"]),
        jenisSim: json["jenis_sim"],
        kadaluarsaSim: DateTime.parse(json["kadaluarsa_sim"]),
        statusPernikahan: json["status_pernikahan"],
        statusTempatTinggal: json["status_tempat_tinggal"],
        noRekening: json["no_rekening"],
        cabangRekening: json["cabang_rekening"],
        noNpwp: json["no_npwp"],
        tanggalTerdaftarNpwp: DateTime.parse(json["tanggal_terdaftar_npwp"]),
        namaWali: json["nama_wali"],
        hpWali: json["hp_wali"],
        telpRumahWali: json["telp_rumah_wali"],
        telpKantorWali: json["telp_kantor_wali"],
        alamatWali: json["alamat_wali"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "no_karyawan": noKaryawan,
        "nama_lengkap": namaLengkap,
        "nama_panggilan": namaPanggilan,
        "alamat_lengkap": alamatLengkap,
        "email": email,
        "no_hp": noHp,
        "no_telp": noTelp,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir.toIso8601String(),
        "golongan_darah": golonganDarah,
        "jenis_kelamin": jenisKelamin,
        "agama": agama,
        "suku_bangsa": sukuBangsa,
        "no_ktp": noKtp,
        "kadaluarsa_ktp": kadaluarsaKtp.toIso8601String(),
        "jenis_sim": jenisSim,
        "kadaluarsa_sim": kadaluarsaSim.toIso8601String(),
        "status_pernikahan": statusPernikahan,
        "status_tempat_tinggal": statusTempatTinggal,
        "no_rekening": noRekening,
        "cabang_rekening": cabangRekening,
        "no_npwp": noNpwp,
        "tanggal_terdaftar_npwp": tanggalTerdaftarNpwp.toIso8601String(),
        "nama_wali": namaWali,
        "hp_wali": hpWali,
        "telp_rumah_wali": telpRumahWali,
        "telp_kantor_wali": telpKantorWali,
        "alamat_wali": alamatWali,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class User {
  String idUser;
  String noKaryawan;
  String username;
  String email;
  String idRole;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  User({
    required this.idUser,
    required this.noKaryawan,
    required this.username,
    required this.email,
    required this.idRole,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        noKaryawan: json["no_karyawan"],
        username: json["username"],
        email: json["email"],
        idRole: json["id_role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "no_karyawan": noKaryawan,
        "username": username,
        "email": email,
        "id_role": idRole,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
