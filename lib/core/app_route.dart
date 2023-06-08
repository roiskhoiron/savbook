import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/presentation/dashboard/dashboard_ui.dart';
import 'package:savbook/app/features/savbook_core/presentation/layanan_karyawan/layanan_karyawan_binding.dart';
import 'package:savbook/app/features/savbook_core/presentation/login/login_binding.dart';
import 'package:savbook/app/features/savbook_core/presentation/login/login_ui.dart';
import 'package:savbook/app/features/savbook_core/presentation/profil_perusahaan/profil_perusahaan_binding.dart';

import '../app/features/savbook_core/presentation/dashboard/dashboard_binding.dart';
import '../app/features/savbook_manajemen_aset/presentation/aset_dihapus/aset_dihapus_binding.dart';
import '../app/features/savbook_manajemen_aset/presentation/aset_rusak/aset_rusak_binding.dart';
import '../app/features/savbook_manajemen_aset/presentation/dokumen_pengajuan_aset/dokumen_pengajuan_aset_binding.dart';
import '../app/features/savbook_manajemen_aset/presentation/semua_aset/semua_aset_binding.dart';
import '../app/features/savbook_manajemen_karyawan/presentation/data_karyawan/data_karyawan_binding.dart';
import '../app/features/savbook_manajemen_karyawan/presentation/data_karyawan_hapus/data_karyawan_hapus_binding.dart';
import '../app/features/savbook_manajemen_karyawan/presentation/data_karyawan_resign/data_karyawan_resign_binding.dart';
import '../app/features/savbook_manajemen_karyawan/presentation/dokumen_pengajuan/dokumen_pengajuan_binding.dart';
import '../app/features/savbook_pengaturan/presentation/cabang/cabang_binding.dart';
import '../app/features/savbook_pengaturan/presentation/formulir/formulir_binding.dart';
import '../app/features/savbook_pengaturan/presentation/hak_akses_pengguna/hak_akses_pengguna_binding.dart';
import '../app/features/savbook_pengaturan/presentation/pengguna/pengguna_binding.dart';
import '../app/features/savbook_pengaturan/presentation/persetujuan/persetujuan_binding.dart';
import '../app/features/savbook_persetujuan/presentation/daftar_persetujuan/daftar_persetujuan_binding.dart';
import '../app/features/savbook_persetujuan/presentation/riwayat_persetujuan/riwayat_persetujuan_binding.dart';

class AppRouter {
  static const initial = LoginUi.routeName;

  static final routes = GetPage(
    name: initial,
    page: () => LoginUi(),
    binding: LoginBinding(),
    children: [
      GetPage(
          name: DashboardUi.routeName,
          page: () => DashboardUi(),
          middlewares: [
            // AuthMiddleware(),
          ],
          bindings: [
            DashboardBinding(),
            DataKaryawanBinding(),
            DokumenPengajuanBinding(),
            DataKaryawanResignBinding(),
            DataKaryawanHapusBinding(),
            ProfilPerusahaanBinding(),
            LayananKaryawanBinding(),
            SemuaAsetBinding(),
            DokumenPengajuanAsetBinding(),
            AsetRusakBinding(),
            AsetDihapusBinding(),
            DaftarPersetujuanBinding(),
            RiwayatPersetujuanBinding(),
            CabangBinding(),
            HakAksesPenggunaBinding(),
            PenggunaBinding(),
            PersetujuanBinding(),
            FormulirBinding()
          ]),
    ],
  );

  static String findRoute(String page) {
    GetPage? foundNode = GetRouteTree.findNode(routes, page);

    if (foundNode == null) {
      return '';
    }

    List<GetPage> trace = [];
    GetRouteTree.buildTrace(routes, foundNode, trace);

    // mencetak laporan jejak node
    return GetRouteTree.printTrace(trace);
  }
}

/// It finds the node with the given data and prints the trace of the node
class GetRouteTree {
  static GetPage? findNode(GetPage node, String data) {
    if (node.name == data) {
      return node;
    } else if (node.children.isNotEmpty) {
      for (GetPage child in node.children) {
        GetPage? result = findNode(child, data);
        if (result != null) {
          return result;
        }
      }
    }
    return null;
  }

  static void buildTrace(GetPage node, GetPage foundNode, List<GetPage> trace) {
    trace.add(node);
    if (node == foundNode) {
      return;
    }
    for (GetPage child in node.children) {
      buildTrace(child, foundNode, trace);
      if (trace.last == foundNode) {
        return;
      }
    }
    trace.removeLast();
  }

  static String printTrace(List<GetPage> trace) {
    // print('Laporan jejak node:');
    var path = '';
    for (int i = 0; i < trace.length; i++) {
      // print('${i + 1}. ${trace[i].data}');
      path += trace[i].name;
    }

    return path;
  }
}
