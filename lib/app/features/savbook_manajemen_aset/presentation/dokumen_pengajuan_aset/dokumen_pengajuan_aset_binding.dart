import 'package:get/get.dart';

import 'dokumen_pengajuan_aset_logic.dart';

class DokumenPengajuanAsetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DokumenPengajuanAsetLogic());
  }
}
