import 'package:get/get.dart';

import 'dokumen_pengajuan_logic.dart';

class DokumenPengajuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DokumenPengajuanLogic());
  }
}
