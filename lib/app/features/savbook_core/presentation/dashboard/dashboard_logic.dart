import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/presentation/profil_perusahaan/profil_perusahaan_ui.dart';

import '../../../savbook_manajemen_aset/presentation/aset_dihapus/aset_dihapus_ui.dart';
import '../../../savbook_manajemen_aset/presentation/aset_rusak/aset_rusak_ui.dart';
import '../../../savbook_manajemen_aset/presentation/dokumen_pengajuan_aset/dokumen_pengajuan_aset_ui.dart';
import '../../../savbook_manajemen_aset/presentation/semua_aset/semua_aset_ui.dart';
import '../../../savbook_manajemen_karyawan/presentation/data_karyawan/data_karyawan_ui.dart';
import '../../../savbook_manajemen_karyawan/presentation/data_karyawan_hapus/data_karyawan_hapus_ui.dart';
import '../../../savbook_manajemen_karyawan/presentation/data_karyawan_resign/data_karyawan_resign_ui.dart';
import '../../../savbook_manajemen_karyawan/presentation/dokumen_pengajuan/dokumen_pengajuan_ui.dart';
import '../../../savbook_pengaturan/presentation/cabang/cabang_ui.dart';
import '../../../savbook_pengaturan/presentation/formulir/formulir_ui.dart';
import '../../../savbook_pengaturan/presentation/hak_akses_pengguna/hak_akses_pengguna_ui.dart';
import '../../../savbook_pengaturan/presentation/pengguna/pengguna_ui.dart';
import '../../../savbook_pengaturan/presentation/persetujuan/persetujuan_ui.dart';
import '../../../savbook_persetujuan/presentation/daftar_persetujuan/daftar_persetujuan_ui.dart';
import '../../../savbook_persetujuan/presentation/riwayat_persetujuan/riwayat_persetujuan_ui.dart';
import '../layanan_karyawan/layanan_karyawan_ui.dart';
import 'dashboard_state.dart';
import 'default_ui.dart';

class DashboardLogic extends GetxController {
  final state = DashboardState();

  Widget showPageOfMenu({required String menu}) {
    switch (menu) {
      case 'Data Karyawan':
        return DataKaryawanUi();
      case 'Dokumen Pengajuan':
        return DokumenPengajuanUi();
      case 'Data Karyawan Resign':
        return DataKaryawanResignUi();
      case 'Data Karyawan Dihapus':
        return DataKaryawanHapusUi();
      case 'Profil Perushaan':
        return ProfilPerusahaanUi();
      case 'Layanan Karyawan':
        return LayananKaryawanUi();
      case 'Semua Aset':
        return SemuaAsetUi();
      case 'Dokumen Pengajuan Aset':
        return DokumenPengajuanAsetUi();
      case 'Aset Rusak':
        return AsetRusakUi();
      case 'Aset Dihapus':
        return AsetDihapusUi();
      case 'Daftar Persetujuan':
        return DaftarPersetujuanUi();
      case 'Riwayat Persetujuan':
        return RiwayatPersetujuanUi();
      case 'Cabang':
        return CabangUi();
      case 'Hak Akses Pengguna':
        return HakAksesPenggunaUi();
      case 'Pengguna':
        return PenggunaUi();
      case 'Persetujuan':
        return PersetujuanUi();
      case 'Formulir':
        return FormulirUi();
      default:
        return const DefaultUi();
    }
  }

  onTapMenu({required String title}) {
    state.onTapMenu.value = title;
  }

  /// membuat fungsi cetak hello world
}
